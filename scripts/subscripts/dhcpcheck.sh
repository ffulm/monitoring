#!/bin/bash

## 03.2018, Jan Hermann, freifunk@jan-hermann.de
##
## Version 1.0
##
## require dhcping
## check dhcp

s=10.33.64.1
c=10.33.99.1
h=00:11:22:33:44:55


tempDHCP=$(/usr/sbin/dhcping -s $s -c $c -h $h)

echo \'dhcpStatus\': \'$tempDHCP\' >> tmp.json
