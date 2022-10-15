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
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
# sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default
# sed -i '$a src-git jerryk https://github.com/jerrykuku/openwrt-package' feeds.conf.default
sed -i '$a src-git luci_app_ddns_go https://github.com/sirpdboy/luci-app-ddns-go' feeds.conf.default

git clone https://github.com/IrineSistiana/mosdns package/mosdns
git clone https://github.com/sbwml/luci-app-mosdns package/luci-app-mosdns
git clone https://github.com/sbwml/v2ray-geodata package/geodata
./scripts/feeds update -a && ./scripts/feeds install -a