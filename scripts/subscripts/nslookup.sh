#!/bin/bash

## 03.2018, Jan Hermann, freifunk@jan-hermann.de
##
## Version 1.0
##
## nslookup intern and extern
##
## nslookup [name] [server]

## zone ffulm
locDNSsrv=10.33.64.1
srvName=vpn1.ffulm

#run nslookup and store data in temp
nslookup $srvName $locDNSsrv | tail -n 3 > DNS.temp

#read temp and save to tmp.json
tname=$(grep Name < DNS.temp | awk '{print $2}')
echo \"dns4ffulm\": \"$tname\", >> tmp.json

taddr=$(grep Address < DNS.temp | awk '{print $2}')
echo \"dns4ffaddr\": \"$taddr\", >> tmp.json

###
## zone internet v4
locDNSsrv=10.33.64.1
srvName=ipv4.google.com

#run nslookup and store data in temp
nslookup $srvName $locDNSsrv | tail -n 3 > DNS.temp

#read temp and save to tmp.json
tname=$(grep Name < DNS.temp | awk '{print $2}')
echo \"dns4name\": \"$tname\", >> tmp.json

taddr=$(grep Address < DNS.temp | awk '{print $2}')
echo \"dns4addr\": \"$taddr\", >> tmp.json

###
## zone internet v4

##ToDo -> not work
#locDNSsrv=fdef:17a0:fff1:300:5254:a2ff:fe01:1f1d
#srvName=ipv6.google.com

#run nslookup and store data in temp
#nslookup $srvName $locDNSsrv | tail -n 3 > DNS.temp

#read temp and save to tmp.json
#tname=$(grep Name < DNS.temp | awk '{print $2}')
#echo \"dns6name\": \"$tname\", >> tmp.json

#taddr=$(grep Address < DNS.temp | awk '{print $2}')
#echo \"dns6addr\": \"$taddr\", >> tmp.json
