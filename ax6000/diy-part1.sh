#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================


# # 增加feeds
sed -i '$a src-git kiddin9 https://github.com/kiddin9/openwrt-packages' feeds.conf.default

# # 更新feeds
# # 这样设计的考虑是防止外挂软件包覆盖原作者的feeds设置
./scripts/feeds update -a

# # 删除kiddin9中会影响编译的包
find feeds/ -name base-files | xargs rm -rf
./scripts/feeds update -i
./scripts/feeds install -a
