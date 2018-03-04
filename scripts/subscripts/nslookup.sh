#!/bin/bash

## 03.2018, Jan Hermann, freifunk@jan-hermann.de
##
## Version 1.0
##
## nslookup intern and extern
##
## nslookup [name] [server]


# readd config-file
FILE="./cfg/config.cfg"
. $FILE

## zone ffulm
#run nslookup and store data in temp
nslookup $srvNameDns $locDNSsrv | tail -n 3 > DNS.temp

#read temp and save to tmp.json
tname=$(grep Name < DNS.temp | awk '{print $2}')
echo \"dns4ffulm\": \"$tname\", >> tmp.json

taddr=$(grep Address < DNS.temp | awk '{print $2}')
echo \"dns4ffaddr\": \"$taddr\", >> tmp.json

###
## zone internet v4
#run nslookup and store data in temp
nslookup $srvNameDnsE $locDNSsrv | tail -n 3 > DNS.temp

#read temp and save to tmp.json
tname=$(grep Name < DNS.temp | awk '{print $2}')
echo \"dns4name\": \"$tname\", >> tmp.json

taddr=$(grep Address < DNS.temp | awk '{print $2}')
echo \"dns4addr\": \"$taddr\", >> tmp.json

###
## zone internet v6

##ToDo -> not work
#locDNSsrv=fdef:17a0:fff1:300:5254:a2ff:fe01:1f1d
#srvNameDnsE6=ipv6.google.com

#run nslookup and store data in temp
#nslookup $srvNameDnsE6 $locDNSsrv | tail -n 3 > DNS.temp

#read temp and save to tmp.json
#tname=$(grep Name < DNS.temp | awk '{print $2}')
#echo \"dns6name\": \"$tname\", >> tmp.json

#taddr=$(grep Address < DNS.temp | awk '{print $2}')
#echo \"dns6addr\": \"$taddr\", >> tmp.json
