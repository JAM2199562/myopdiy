#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================


# Add a feed source
sed -i '$a src-git kiddin9 https://github.com/kiddin9/openwrt-packages' feeds.conf.default
./scripts/feeds update -a && ./scripts/feeds install -a

# 安装v2ray-geodata
find . -name v2ray-geodata | xargs rm -rf
git clone https://github.com/sbwml/v2ray-geodata package/geodata

#安装mosdns
git clone https://github.com/sbwml/luci-app-mosdns package/luci-app-mosdns


#安装mosdns
# ./scripts/feeds install  -f -p kiddin9 v2ray-geodata
# ./scripts/feeds install  -f -p kiddin9 mosdns
# ./scripts/feeds install  -f -p kiddin9 luci-app-mosdns
# ls feeds/kiddin9 | grep -v  '\(luci-app-mosdns\|mosdns\|v2ray-geodata\)' | awk  '{system("rm -rf "$1)}'
git clone https://github.com/sbwml/luci-app-mosdns package/luci-app-mosdns
rm -rf feeds/kiddin9/luci-app-mosdns
rm -rf feeds/packages/net/mosdns
rm -rf feeds/kiddin9/mosdns
./scripts/feeds update -i