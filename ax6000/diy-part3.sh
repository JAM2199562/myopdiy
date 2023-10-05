#!/bin/bash
#============================================================
# 针对特定软件的自定义设置
#============================================================

# 增加禁用IPV6的脚本
chmod a+x openwrt/files/etc/init.d/disable-ipv6.sh

# 针对特别软件的自定义设置
## 避免alist依赖的go在feeds操作时被覆盖掉
# rm -rf feeds/packages/lang/golang
# git clone https://github.com/sbwml/packages_lang_golang -b 20.x feeds/packages/lang/golang
# chmod a+x files/usr/bin/lucky
## 将mosdns降级到4.5.3以兼容easymosdns
## 这块可能不用了，因为diy-part1中一定
# sed -i '/^PKG_HASH/cPKG_HASH:=2a13b1b1d862731cf946a8ceaa99523a0eb0eaae56045dd31207b61a5a6d47ae' package/feeds/packages/mosdns/Makefile
# sed -i '/^PKG_VERSION/cPKG_VERSION:=4.5.3' package/feeds/packages/mosdns/Makefile
# rm -rf ./feeds/packages/net/mosdns
## 安装easymosdns
# [ ! -e easymosdns.tar.gz ] && wget https://mirror.apad.pro/dns/easymosdns.tar.gz
# tar xzf easymosdns.tar.gz
# mv -f easymosdns/ files/etc/mosdns/
# mosdns_working_dir="files/etc/mosdns"
# source $mosdns_working_dir/include.conf
# sed -i '/^        - ecs_auto/c\        #- ecs_auto' $mosdns_working_dir/config.yaml
# sed -i '/^            - ecs_auto/c\            # - ecs_auto' $mosdns_working_dir/config.yaml
# sed -i '/^            - ecs_global/c\            #- ecs_global' $mosdns_working_dir/config.yaml
# echo 'ECS:Off'
# mv files/etc/mosdns/rules files/etc/mosdns/rule
# sed -i 's/mosdns service/\/etc\/init.d\/mosdns/g' $mosdns_working_dir/restart.service
# # sed -i 's/file\: \".\/mosdns.log\"/file\: \"\/tmp\/mosdns.log\"/g' $mosdns_working_dir/config.yaml
# sed -i 's/file: .\/hosts.txt/file: .\/rule\/hosts.txt/g' $mosdns_working_dir/config.yaml
# sed -i 's/0.0.0.0\:53\"/0.0.0.0\:5335\"/g' $mosdns_working_dir/config.yaml
# sed -i 's/level\: error/level\: loglvl/g' $mosdns_working_dir/config.yaml
# sed -i 's/file\: \".\/mosdns.log"/file: logfile/g' $mosdns_working_dir/config.yaml
# sed -i 's/rules/rule/g' $mosdns_working_dir/config.yaml
# cp $mosdns_working_dir/config.yaml $mosdns_working_dir/def_config_orig.yaml
# rm -rf feeds/packages/net/mosdns/patches