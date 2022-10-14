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
sed '2 auci comit' -i package/lean/default-settings/files/zzz-default-settings

# Add a feed source
sed -i '$a src-git liuran001_packages https://github.com/liuran001/openwrt-packages' feeds.conf.default
sed -i '$a src-git small8 https://github.com/kenzok8/small-package' feeds.conf.default


./scripts/feeds update -a && ./scripts/feeds install -a

# ## small8的mosdns和v2ray-geodata有问题,liuran001的adg编译有问题

#安装mosdns
#./scripts/feeds uninstall luci-app-mosdns mosdns
./scripts/feeds install -f -p liuran001_packages mosdns luci-app-mosdns

#强制使用small8安装adguard
./scripts/feeds uninstall adguardhome luci-app-adguardhome
./scripts/feeds install -f -p small8 adguardhome luci-app-adguardhome

#安装passwall
#./scripts/feeds uninstall luci-app-passwall
./scripts/feeds install -f -p small8 luci-app-passwall

#安装passwall2
#./scripts/feeds uninstall luci-app-passwall2
./scripts/feeds install -f -p small8 luci-app-passwall2

# 安装HelloWorld
#./scripts/feeds uninstall luci-app-vssr
./scripts/feeds install -f -p jerryk luci-app-vssr
