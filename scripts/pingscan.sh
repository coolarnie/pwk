#!/bin/bash

for ip in $(seq 1 125); do
ping -c 1 192.168.1.$ip |grep "bytes from" |cut -d" " -f4 |cut -d":" -f1 &
done
for ip2 in $(seq 126 254); do
ping -c 1 192.168.1.$ip2 |grep "bytes from" |cut -d" " -f4 |cut -d":" -f1 &
done
