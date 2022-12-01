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

# # 删除kiddin9中会影响编译的包
rm -rf feeds/kiddin9/base-files/

# # 更新feeds
# # 这样设计的考虑是防止外挂软件包覆盖原作者的feeds设置
./scripts/feeds update -a && ./scripts/feeds install -a

# # 安装v2ray-geodata
# find feeds/ -name "*geodata*" | xargs rm -rf
# find package/ -name "*geodata*" | xargs rm -rf
# git clone https://github.com/sbwml/v2ray-geodata package/geodata

# # 安装mosdns
# find feeds/ -name "*mosdns*" | xargs rm -rf
# find package/ -name "*mosdns*" | xargs rm -rf
# git clone https://github.com/sbwml/luci-app-mosdns package/luci-app-mosdns
# ./scripts/feeds update -i

# 安装ddns-go
# find feeds/ -name "*ddns-go*" | xargs rm -rf
# find package/ -name "*ddns-go*" | xargs rm -rf
# git clone https://github.com/sirpdboy/luci-app-ddns-go.git package/ddns-go
