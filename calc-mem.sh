#!/bin/bash
if [[ $USER != root ]]; then
echo -e "\e[00;31mERROR: must be root\e[00m"
exit 1
fi
page_size=$(getconf PAGE_SIZE)
phys_pages=$(getconf _PHYS_PAGES)
shmall=`expr $phys_pages / 2`
shmmax=`expr $shmall \* $page_size`
mkdir -p /etc/sysctl.d
echo "kernel.shmmax = $shmmax" > /etc/sysctl.d/calc-mem.conf
echo "kernel.shmall = $shmall" >> /etc/sysctl.d/calc-mem.conf
echo "kernel.shmmax = $shmmax"
echo "kernel.shmall = $shmall"
echo -e "\e[00;1;92mFinished...\e[00m"
exit 0
