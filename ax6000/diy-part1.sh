#!/bin/bash
#=============================================================
# 自定义源代码和包
#=============================================================

# upx相关的设置(upx已经通过依赖安装在主机上，应该不用这个了)
# git clone https://github.com/kuoruan/openwrt-upx.git package/mycustom/openwrt-upx &&\
# cd package/mycustom/openwrt-upx &&\
# git checkout -b e5b33e219922f427a04372f5eb7b1bb0cc8db848
# cd ../../..

# # 增加alist(2023.10.6 不再编译alist，它依赖的go太高，会导致其他软件编译失败)
# ls -al feeds/packages/lang/golang
# git clone https://github.com/sbwml/luci-app-alist.git package/z_luci-app-alist

# 增加luci-app-mosdns(2023.10.5 简化mosdns，不再使用4.5.3版本)
# rm -rf ./feeds/packages/net/mosdns
# git clone https://github.com/sbwml/luci-app-mosdns.git package/z_luci-app-mosdns

# 增加adguard
git clone https://github.com/kiddin9/openwrt-adguardhome.git package/z_openwrt-adguardhome

# 增加luci-app-ddns-go
git clone https://github.com/sirpdboy/luci-app-ddns-go package/z_luci-app-ddns-go

# 增加luci-app-lucky
git clone https://github.com/gdy666/luci-app-lucky.git package/z_luci-app-lucky
