#!/bin/bash
#============================================================
# 自定义设置
#============================================================
# 增加禁用IPV6的脚本
[ -e files ] && mv files openwrt/files
chmod a+x openwrt/files/etc/init.d/disable-ipv6.sh
cd openwrt
sed -i '/DTS_DIR:=$(LINUX_DIR)/a\BUILD_DATE_PREFIX := $(shell TZ=Asia/Shanghai date +'%Y%m%d-%H%M')' ./include/image.mk
sed -i 's/IMG_PREFIX:=/IMG_PREFIX:=$(BUILD_DATE_PREFIX)-/g' ./include/image.mk
sed -i "s/hostname='ImmortalWrt'/hostname='MyRouter'/g" ./package/base-files/files/bin/config_generate

sed -i 's/192.168.1.1/192.168.9.1/g' package/base-files/files/bin/config_generate
#sed -i 's/192.168/172.16/g' package/base-files/files/bin/config_generate

