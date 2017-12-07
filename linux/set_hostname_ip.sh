#!/bin/bash

# set hostname and ip
# write by songyanlin 2017-11-14

function EchoHelp(){
    echo "use: ./set_hostname_ip.sh {hostname} {ip} {prefix-length}"
}

host_name=$1
ip=$2
prefix_length=$3


if [ $host_name -a $ip -a $prefix_length ]; then
    hostnamectl set-hostname $host_name
    sed -i "s/^IPADDR=.*/IPADDR=\"$ip\"/" /etc/sysconfig/network-scripts/ifcfg-ens160
    sed -i "s/^PREFIX=.*/PREFIX=\"$prefix_length\"/" /etc/sysconfig/network-scripts/ifcfg-ens160
    systemctl restart network
else
    EchoHelp

fi

