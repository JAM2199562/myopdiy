#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================


# # 增加feeds
sed -i '$a src-git kiddin9 https://github.com/kiddin9/openwrt-packages' feeds.conf.default

# # 更新feeds
# # 这样设计的考虑是防止外挂软件包覆盖原作者的feeds设置
./scripts/feeds update -a

# # # 删除kiddin9中会影响编译的包
# find feeds/ -name base-files | xargs rm -rf
# find feeds/ -name "*mosdns*" | xargs rm -rf
# find feeds/ -name "v2ray-geo*" | xargs rm -rf
# find package/ -name "*mosdns*" | xargs rm -rf
# find package/ -name "v2ray-geo*" | xargs rm -rf

# 安装sbwml的luci-app-mosdns，这个版本的可以正常自动启动
# git clone https://github.com/sbwml/luci-app-mosdns package/luci-app-mosdns
# git clone https://github.com/sbwml/v2ray-geodata package/geodata
sed -i "s/mosdns.config.configfile/mosdns.mosdns.configfile/g" package/luci-app-mosdns/luci-app-mosdns/root/etc/init.d/mosdns
./scripts/feeds update -i
./scripts/feeds install -a
