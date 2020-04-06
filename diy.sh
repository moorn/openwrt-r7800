#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# 固件名称
uci set system.@system[0].hostname=R7
uci set system.@system[0].timezone=CST-8
uci set system.@system[0].zonename=Asia/Shanghai
uci commit system


#设置默认管理IP地址
uci set network.lan.ipaddr='10.0.0.1'
uci set network.lan.netmask='255.255.255.0'
uci set network.lan.delegate='0'
uci set network.wan.delegate='0'
uci commit network

sed -i '/log-facility/d' /etc/dnsmasq.conf
echo "log-facility=/dev/null" >> /etc/dnsmasq.conf

exit 0

