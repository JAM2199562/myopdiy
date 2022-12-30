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
find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
find ./ | grep Makefile | grep mosdns | xargs rm -f
git clone https://github.com/sbwml/luci-app-mosdns package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
sed -i 's/def_config.yaml/config.yaml/g' package/mosdns/luci-app-mosdns/root/etc/config/mosdns

# 增加luci-app-ddns-go
git clone https://github.com/sirpdboy/luci-app-ddns-go package/luci-app-ddns-go

# 增加luci-app-lucky
git clone  https://github.com/gdy666/luci-app-lucky.git package/lucky