#!/bin/bash
set -e

# 定义变量
REPO_URL="https://github.com/hanwckf/immortalwrt-mt798x"
REPO_BRANCH="openwrt-21.02"
SOURCE_ROOT="hanwckf_immortalwrt-mt798x"
FILES_DIR="$(pwd)/files"
MAX_RETRIES=5
RETRY_DELAY=3

# 定义函数：克隆或更新 git 仓库
git_clone_or_pull() {
    local repo_url=$1
    local branch=$2
    local target_dir=$3

    if [ -d "${target_dir}/.git" ]; then
        echo "Repository exists in ${target_dir}, pulling latest changes..."
        cd "${target_dir}"
        attempt=1
        until [ $attempt -ge $MAX_RETRIES ]; do
            git pull && break
            echo "git pull failed, retrying in ${RETRY_DELAY} seconds... ($attempt/$MAX_RETRIES)"
            attempt=$((attempt+1))
            sleep $RETRY_DELAY
        done
        if [ $attempt -eq $MAX_RETRIES ]; then
            echo "git pull failed after $MAX_RETRIES attempts."
            exit 1
        fi
    else
        echo "Cloning repository from ${repo_url} into ${target_dir}..."
        attempt=1
        until [ $attempt -ge $MAX_RETRIES ]; do
            git clone --depth 1 ${repo_url} ${target_dir} && break
            echo "git clone failed, retrying in ${RETRY_DELAY} seconds... ($attempt/$MAX_RETRIES)"
            attempt=$((attempt+1))
            sleep $RETRY_DELAY
        done
        if [ $attempt -eq $MAX_RETRIES ]; then
            echo "git clone failed after $MAX_RETRIES attempts."
            exit 1
        fi
    fi
}

# 安装编译环境
echo "Installing build environment..."
sudo apt-get update -qq
sudo apt-get install -y build-essential ccache libncurses5-dev zlib1g-dev gawk flex quilt \
  git-core gettext libssl-dev xsltproc wget zlib1g-dev libcurl4-openssl-dev \
  unzip libelf-dev
sudo apt-get autoremove --purge
sudo apt-get clean

# 清理编译残存
echo "Cleaning up previous build remnants..."
#rm -rf ${SOURCE_ROOT}

# 下载或更新固件源码
echo "Managing firmware source code..."
git_clone_or_pull ${REPO_URL} ${REPO_BRANCH} "${SOURCE_ROOT}"
# 将 files 文件夹软连接到源码目录
if [ -d "${FILES_DIR}" ]; then
    echo "Linking files directory to source root..."
    mkdir -p "${SOURCE_ROOT}/files"
    ln -sfn "${FILES_DIR}" "${SOURCE_ROOT}/files"
else
    echo "Error: files directory not found!"
    exit 1
fi

# 确保进入源码目录
cd ${SOURCE_ROOT}

# 自定义源代码和包 (DIY_P1)
echo "Running DIY_P1 customizations..."
rm -rf feeds/packages/net/mosdns
git_clone_or_pull "https://github.com/sbwml/luci-app-mosdns.git" "" "package/z_luci-app-mosdns"
git_clone_or_pull "https://github.com/kiddin9/openwrt-adguardhome.git" "" "package/z_openwrt-adguardhome"
git_clone_or_pull "https://github.com/sirpdboy/luci-app-ddns-go.git" "" "package/z_luci-app-ddns-go"
git_clone_or_pull "https://github.com/gdy666/luci-app-lucky.git" "" "package/z_luci-app-lucky"
git_clone_or_pull "https://github.com/animegasan/luci-app-cloudflared.git" "" "package/z_luci-app-cloudflared"
git_clone_or_pull "https://github.com/mingxiaoyu/luci-app-cloudflarespeedtest.git" "" "package/z_luci-app-cloudflarespeedtest"
git_clone_or_pull "https://github.com/immortalwrt-collections/openwrt-cdnspeedtest.git" "" "package/z_openwrt-cdnspeedtest"
git_clone_or_pull "https://github.com/xiaorouji/openwrt-passwall2.git" "" "package/z_luci-app-passwall2"

# 确认 image.mk 文件是否存在，并进行自定义设置 (DIY_P2)
echo "Running DIY_P2 customizations..."
cd /workdir/${SOURCE_ROOT}
if [ -f "./include/image.mk" ]; then
    sed -i '/DTS_DIR:=$(LINUX_DIR)/a\BUILD_DATE_PREFIX := $(shell TZ=Asia/Shanghai date +'%Y%m%d-%H%M')' ./include/image.mk
    sed -i 's/IMG_PREFIX:=/IMG_PREFIX:=$(BUILD_DATE_PREFIX)-/g' ./include/image.mk
else
    echo "Error: image.mk file not found!"
    exit 1
fi

# 自定义路由器配置
sed -i "s/hostname='ImmortalWrt'/hostname='MyRouter'/g" ./package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.9.1/g' package/base-files/files/bin/config_generate

# 针对特定软件的自定义设置 (DIY_P3)
echo "Running DIY_P3 customizations..."
# 省略特定软件的设置内容，根据需要添加

# 更新插件和配置
echo "Updating feeds and installing packages..."
./scripts/feeds update -a
./scripts/feeds install -a

# 生成编译配置
echo "Generating build configuration..."
cat files/ax6000.config >> .config
#[ -e ax6000/ax6000.config ] && cat ax6000/ax6000.config >> .config
make defconfig

# 下载软件包
echo "Downloading packages..."
make download -j8

# 开始编译固件
echo "Starting firmware compilation..."
make -j$(nproc) 

