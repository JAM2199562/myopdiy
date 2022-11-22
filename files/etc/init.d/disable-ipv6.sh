#!/bin/sh
read -r -p "本脚本没有回滚功能，一旦禁用IPv6只能通过重置恢复，确认执行吗 [Y/n] " input

case $input in
    [yY][eE][sS]|[yY])
		echo "Yes"
		;;

    [nN][oO]|[nN])
		echo "No"
    ;;

    *)
		echo "Invalid input..."
		exit 1
		;;
esac
echo 'net.ipv6.conf.all.disable_ipv6 = 1' >> /etc/sysctl.conf
sysctl -p /etc/sysctl.conf
uci set 'network.lan.ipv6=0'
uci set 'network.wan.ipv6=0'
uci set 'dhcp.lan.dhcpv6=disabled'
uci commit
uci -q delete dhcp.lan.dhcpv6
uci -q delete dhcp.lan.ra
uci commit dhcp
uci set network.lan.delegate="0"
uci commit network
uci -q delete network.globals.ula_prefix
uci commit
/etc/init.d/odhcpd disable
/etc/init.d/network restart
/etc/init.d/odhcpd stop
