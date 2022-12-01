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

# # 删除kiddin9中会影响编译的包
rm -rf feeds/kiddin9/base-files/
# # 更新feeds
# # 这样设计的考虑是防止外挂软件包覆盖原作者的feeds设置
./scripts/feeds update -a && ./scripts/feeds install -a
