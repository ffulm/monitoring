#!/bin/bash

## 03.2018, Jan Hermann, freifunk@jan-hermann.de
##
## Version 1.0
##
## show exit ip


# readd config-file
FILE="./cfg/config.cfg"
. $FILE


# add route
ip r add $snip/$snm via $gwr
# print route
eip=$(ip r l | grep $snip | awk '{print $1}')
echo \"exitip4route\": \"$eip\", >> tmp.json

# call netcat for IP-Address and print
myIPtmp=$(nc -w $wEip $snip $prt | grep IPv4)
echo \"myIP\": \"$myIPtmp\", >> tmp.json

#delete route
ip r del $snip/$snm
