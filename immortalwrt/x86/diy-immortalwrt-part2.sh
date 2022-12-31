#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================
sed -i '/DTS_DIR:=$(LINUX_DIR)/a\BUILD_DATE_PREFIX := $(shell date +'%Y%m%d-%H%M')' ./include/image.mk
sed -i 's/IMG_PREFIX:=/IMG_PREFIX:=$(BUILD_DATE_PREFIX)-/g' ./include/image.mk
#sed -i "s/DISTRIB_DESCRIPTION='OpenWrt '/DISTRIB_DESCRIPTION='OpenWrt-Firker '/g" ./package/lean/default-settings/files/zzz-default-settings
sed -i "s/hostname='OpenWrt'/hostname='ImmortalWrt'/g" ./package/base-files/files/bin/config_generate


# Modify default IP
sed -i 's/192.168.1.1/172.16.3.2/g' package/base-files/files/bin/config_generate
sed -i 's/192.168/172.16/g' package/base-files/files/bin/config_generate

# Install easymosdns
[ ! -e easymosdns.tar.gz ] && wget https://mirror.apad.pro/dns/easymosdns.tar.gz
tar xzf easymosdns.tar.gz
mv -f easymosdns/ files/etc/mosdns/
mosdns_working_dir="files/etc/mosdns"
source $mosdns_working_dir/include.conf
sed -i '/^        - ecs_auto/c\        #- ecs_auto' $mosdns_working_dir/config.yaml
sed -i '/^            - ecs_auto/c\            # - ecs_auto' $mosdns_working_dir/config.yaml
sed -i '/^            - ecs_global/c\            #- ecs_global' $mosdns_working_dir/config.yaml
echo 'ECS:Off'

sed -i 's/def_config.yaml/config.yaml/g' package/mosdns/luci-app-mosdns/root/etc/config/mosdns
sed -i 's/file\: \".\/mosdns.log\"/file\: \"\/tmp\/mosdns.log\"/g' $mosdns_working_dir/config.yaml
sed -i 's/0.0.0.0\:53\"/0.0.0.0\:5335\"/g' $mosdns_working_dir/config.yaml
sed -i 's/mosdns service/\/etc\/init.d\/mosdns/g' $mosdns_working_dir/restart.service

