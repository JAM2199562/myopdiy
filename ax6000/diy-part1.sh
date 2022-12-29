#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

#增加luci-app-mosdns
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-mosdns package/luci-app-mosdns
sed -i 's/def_config.yaml/config.yaml/g' package/luci-app-mosdns/root/etc/config/mosdns

#增加luci-app-ddns-go
git clone https://github.com/sirpdboy/luci-app-ddns-go package/luci-app-ddns-go

# 增加luci-app-lucky
git clone  https://github.com/gdy666/luci-app-lucky.git package/lucky
