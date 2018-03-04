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

#call dhcping an store data to var
tempDHCP=$(/usr/sbin/dhcping -s $s -c $c -h $hwAddr)

echo \'dhcpStatus\': \'$tempDHCP\', >> tmp.json
