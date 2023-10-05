#!/bin/bash
#=============================================================
# 自定义源代码和包
#=============================================================

# upx相关的设置
# git clone https://github.com/kuoruan/openwrt-upx.git package/mycustom/openwrt-upx &&\
# cd package/mycustom/openwrt-upx &&\
# git checkout -b e5b33e219922f427a04372f5eb7b1bb0cc8db848
# cd ../../..

# 增加luci-app-mosdns(2023.10.5 简化mosdns，不再使用4.5.3版本)

git clone https://github.com/sbwml/luci-app-mosdns.git package/luci-app-mosdns \

# 增加luci-app-ddns-go
git clone https://github.com/sirpdboy/luci-app-ddns-go package/z_luci-app-ddns-go

# 增加luci-app-lucky
git clone https://github.com/gdy666/luci-app-lucky.git package/z_lucky

# 增加alist
ls -al feeds/packages/lang/golang
git clone https://github.com/sbwml/luci-app-alist.git package/z_luci-app-alist

# 增加adguard
git clone https://github.com/kiddin9/openwrt-adguardhome.git package/z_openwrt-adguardhome