#!/bin/bash

## 03.2018, Jan Hermann, freifunk@jan-hermann.de
##
## Version 1.0
##
## require dhcping
## check dhcp


# readd config-file
FILE="./cfg/config.cfg"
. $FILE

s=10.33.64.1
c=10.33.99.1


tempDHCP=$(/usr/sbin/dhcping -s $s -c $c -h $hwAddr)

echo \'dhcpStatus\': \'$tempDHCP\', >> tmp.json
