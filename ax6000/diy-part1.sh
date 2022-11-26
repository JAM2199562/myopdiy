#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

# # 使用x-wrt的dts文件
wget -O target/linux/mediatek/dts/mt7986a-xiaomi-redmi-router-ax6000.dts https://tinyurl.com/x-wrt-ax6000-dts

# # 增加feeds
# # sed -i '$a src-git kiddin9 https://github.com/kiddin9/openwrt-packages' feeds.conf.default

# # 更新feeds
./scripts/feeds update -a && ./scripts/feeds install -a


# 安装ddns-go
find feeds/ -name "*ddns-go*" | xargs rm -rf
find package/ -name "*ddns-go*" | xargs rm -rf
git clone https://github.com/sirpdboy/luci-app-ddns-go.git package/ddns-go
