#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

# 先安装原生的
./scripts/feeds update -a && ./scripts/feeds install -a

# 增加其它源
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
#sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default
sed -i '$a src-git jerryk https://github.com/jerrykuku/openwrt-package' feeds.conf.default
sed -i '$a src-git liuran001_packages https://github.com/liuran001/openwrt-packages' feeds.conf.default
sed -i '$a src-git-full opackages https://git.openwrt.org/feed/packages.git' feeds.conf.default
sed -i '$a src-git small8 https://github.com/kenzok8/small-package' feeds.conf.default

# 更新包
./scripts/feeds update -a

# 强制安装liuran001的所有包
./scripts/feeds install -a -f -p liuran001_packages

## 优选包：small8的mosdns和v2ray-geodata有问题,liuran001的adg编译有问题

# 安装luci-app-vlmcsd
git clone https://github.com/cokebar/luci-app-vlmcsd.git package/luci-app-vlmcsd
git clone https://github.com/cokebar/openwrt-vlmcsd.git package/openwrt-vlmcsd

# 安装mosdns
./scripts/feeds uninstall luci-app-mosdns mosdns
./scripts/feeds install -f -p liuran001_packages mosdns luci-app-mosdns

#强制使用small8安装adguard
./scripts/feeds uninstall adguardhome luci-app-adguardhome
./scripts/feeds install -f -p small8 adguardhome luci-app-adguardhome

# 安装passwall
./scripts/feeds uninstall luci-app-passwall
./scripts/feeds install -f -p small8 luci-app-passwall

# 安装passwall2
./scripts/feeds uninstall luci-app-passwall2
./scripts/feeds install -f -p small8 luci-app-passwall2

# 安装HelloWorld
./scripts/feeds uninstall luci-app-vssr
./scripts/feeds install -f -p jerryk luci-app-vssr

# 安装luci-theme-argon
./scripts/feeds uninstall luci-theme-argon luci-theme-argon-18.06 luci-theme-argon-lr luci-theme-argonne luci-app-argonne-config
find ./ -name luci-theme-argon* | xargs rm -rf
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon

# 安装v2ray-geodata
find ./ -name v2ray-geodata | xargs rm -rf
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata

# 更新缓存并安装遗漏包
./scripts/feeds update -i && ./scripts/feeds install -a
