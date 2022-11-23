#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

sed '1 auci set luci.main.mediaurlbase=/luci-static/argon' -i package/lean/default-settings/files/zzz-default-settings
sed '2 auci comit luci' -i package/lean/default-settings/files/zzz-default-settings

# Add a feed source
sed -i '$a src-git liuran001_packages https://github.com/liuran001/openwrt-packages' feeds.conf.default
sed -i '$a src-git small8 https://github.com/kenzok8/small-package' feeds.conf.default
sed -i '$a src-git luci_app_ddns_go https://github.com/sirpdboy/luci-app-ddns-go' feeds.conf.default

./scripts/feeds update -a && ./scripts/feeds install -a

# ## small8的mosdns和v2ray-geodata有问题,liuran001的adg编译有问题

# 安装v2ray-geodata
find package -name v2ray-geodata | xargs rm -rf
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata

#安装mosdns
git clone https://github.com/sbwml/luci-app-mosdns package/luci-app-mosdns

#强制使用small8安装adguard
./scripts/feeds install -f -p small8 adguardhome luci-app-adguardhome

#安装passwall
./scripts/feeds install -f -p small8 luci-app-passwall

#安装passwall2
./scripts/feeds install -f -p small8 luci-app-passwall2

# 安装HelloWorld
./scripts/feeds install -f -p jerryk luci-app-vssr