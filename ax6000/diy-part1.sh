#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

# upx相关的设置
# git clone https://github.com/kuoruan/openwrt-upx.git package/mycustom/openwrt-upx &&\
# cd package/mycustom/openwrt-upx &&\
# git checkout -b e5b33e219922f427a04372f5eb7b1bb0cc8db848
# cd ../../..

# 增加luci-app-mosdns
rm -rf ./feeds/packages/net/mosdns
git clone  https://github.com/QiuSimons/openwrt-mos package/openwrt-mos \
&& cd package/openwrt-mos && git checkout 40b669b564e3876cd02aeb148fccd576647394cc \
&& mv -n {*mosdns,v2ray-geodata} ../ && cd ../.. && rm -rf package/openwrt-mos

# 增加luci-app-ddns-go
git clone https://github.com/sirpdboy/luci-app-ddns-go package/z_luci-app-ddns-go

# 增加luci-app-lucky
git clone https://github.com/gdy666/luci-app-lucky.git package/z_lucky

# 增加alist
ls -al feeds/packages/lang/golang
git clone https://github.com/sbwml/luci-app-alist.git package/z_luci-app-alist

# 增加adguard
git clone https://github.com/kiddin9/openwrt-adguardhome.git package/z_openwrt-adguardhome