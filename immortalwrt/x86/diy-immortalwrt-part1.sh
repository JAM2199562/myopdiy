#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# License: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

# 增加luci-app-mosdns
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-mosdns package/z_luci-app-mosdns

# 增加luci-app-ddns-go
git clone https://github.com/sirpdboy/luci-app-ddns-go package/z_luci-app-ddns-go

# 增加luci-app-lucky
git clone https://github.com/gdy666/luci-app-lucky.git package/z_lucky

# 增加alist
ls -al feeds/packages/lang/golang
git clone https://github.com/sbwml/luci-app-alist.git package/z_luci-app-alist

# 增加adguard
git clone https://github.com/kiddin9/openwrt-adguardhome.git package/z_openwrt-adguardhome

# 增加v2ray-geodata
# git clone https://github.com/sbwml/v2ray-geodata package/z_v2ray-geodata
