#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

# 增加luci-app-mosdns
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-mosdns package/luci-app-mosdns
sed -i 's/def_config.yaml/config.yaml/g' package/luci-app-mosdns/root/etc/config/mosdns

# 增加luci-app-ddns-go
git clone https://github.com/sirpdboy/luci-app-ddns-go package/luci-app-ddns-go

# # 增加luci-app-lucky
# git clone https://github.com/sirpdboy/luci-app-lucky.git package/lucky
# cd package/lucky
# git checkout 2201a903125ef220cf6f85270bfd74c17cbd9b34
# cd $GITHUB_WORKSPACE/openwrt

# 增加alist
rm -rf feeds/packages/lang/golang
svn export https://github.com/sbwml/packages_lang_golang/branches/19.x feeds/packages/lang/golang
ls -al feeds/packages/lang/golang
git clone https://github.com/sbwml/luci-app-alist.git package/luci-app-alist

# 增加adguard
git clone https://github.com/kiddin9/openwrt-adguardhome.git package/openwrt-adguardhome