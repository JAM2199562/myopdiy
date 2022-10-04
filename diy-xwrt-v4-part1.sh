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
git checkout feeds.conf.default
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
#sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default
sed -i '$a src-git jerryk https://github.com/jerrykuku/openwrt-package' feeds.conf.default
sed -i '$a src-git liuran001_packages https://github.com/liuran001/openwrt-packages' feeds.conf.default
sed -i '$a src-git-full opackages https://git.openwrt.org/feed/packages.git' feeds.conf.default
sed -i '$a src-git small8 https://github.com/kenzok8/small-package' feeds.conf.default

#rm -rf package/ feeds/ && git checkout package

git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
git clone https://github.com/cokebar/luci-app-vlmcsd.git package/luci-app-vlmcsd
git clone https://github.com/cokebar/openwrt-vlmcsd.git package/openwrt-vlmcsd
./scripts/feeds update -a
## small8的mosdns和v2ray-geodata有问题,liuran001的adg编译有问题

#安装所有包
./scripts/feeds install -a -f -p liuran001_packages
#./scripts/feeds install -a

#安装mosdns
./scripts/feeds uninstall luci-app-mosdns mosdns
./scripts/feeds install -f -p liuran001_packages mosdns luci-app-mosdns

#强制使用small8安装adguard
./scripts/feeds uninstall adguardhome luci-app-adguardhome
./scripts/feeds install -f -p small8 adguardhome luci-app-adguardhome

#安装passwall
./scripts/feeds uninstall luci-app-passwall
./scripts/feeds install -f -p small8 luci-app-passwall

#安装passwall2
./scripts/feeds uninstall luci-app-passwall2
./scripts/feeds install -f -p small8 luci-app-passwall2

# 安装HelloWorld
./scripts/feeds uninstall luci-app-vssr
./scripts/feeds install -f -p jerryk luci-app-vssr
