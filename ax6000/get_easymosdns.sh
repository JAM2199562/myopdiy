#!/bin/bash
wget https://mirror.apad.pro/dns/easymosdns.tar.gz --no-check-certificate
tar xzf easymosdns.tar.gz
sed -i 's/file\: \".\/mosdns.log\"/file\: \"\/tmp\/mosdns.log\"/g' files/etc/mosdns/config.yaml
mv -f easymosdns/* files/etc/mosdns

mosdns_working_dir="files/etc/mosdns"
source $mosdns_working_dir/include.conf
sed -i '/^        - ecs_auto/c\        #- ecs_auto' $mosdns_working_dir/config.yaml
sed -i '/^            - ecs_auto/c\            # - ecs_auto' $mosdns_working_dir/config.yaml
sed -i '/^            - ecs_global/c\            #- ecs_global' $mosdns_working_dir/config.yaml
echo 'ECS:Off'
