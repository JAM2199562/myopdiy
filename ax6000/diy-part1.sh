#!/bin/bash
#=============================================================
# 自定义源代码和包
#=============================================================

# upx相关的设置(upx已经通过依赖安装在主机上，应该不用这个了)
# git clone https://github.com/kuoruan/openwrt-upx.git package/mycustom/openwrt-upx &&\
# cd package/mycustom/openwrt-upx &&\
# git checkout -b e5b33e219922f427a04372f5eb7b1bb0cc8db848
# cd ../../..

# # 增加alist(2023.10.6 alist在源代码中自带了)
# ls -al feeds/packages/lang/golang
# git clone https://github.com/sbwml/luci-app-alist.git package/z_luci-app-alist

# 增加adguard
# git clone https://github.com/kiddin9/openwrt-adguardhome.git package/z_openwrt-adguardhome

# 增加luci-app-ddns-go
# git clone https://github.com/sirpdboy/luci-app-ddns-go package/z_luci-app-ddns-go
# 替换go的版本
rm -rf feeds/packages/lang/golang/
git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang

# 增加luci-app-lucky
git clone https://github.com/gdy666/luci-app-lucky.git package/z_luci-app-lucky

# 更换go版本
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang
# 增加luci-app-passwall2
echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"
echo "src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git;main" >> "feeds.conf.default"
./scripts/feeds update -a && ./scripts/feeds install -a


# # 增加cloudflare 测速
# git clone https://github.com/mingxiaoyu/luci-app-cloudflarespeedtest.git package/z_luci-app-cloudflarespeedtest
# git clone https://github.com/immortalwrt-collections/openwrt-cdnspeedtest.git package/z_openwrt-cdnspeedtest
# chmod a+x package/z_luci-app-cloudflarespeedtest/applications/luci-app-cloudflarespeedtest/root/usr/bin/cloudflarespeedtest/cloudflarespeedtest.sh