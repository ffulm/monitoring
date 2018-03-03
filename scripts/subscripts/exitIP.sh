#!/bin/bash

## 03.2018, Jan Hermann, freifunk@jan-hermann.de
##
## Version 1.0
##
## show exit ip


ip r add 212.83.150.199/32 via 10.33.64.1

eip=$(ip r l | grep 212.83.150.199 | awk '{print $1}')

echo \"exitip4route\": \"$eip\", >> tmp.json

nc -w 5 212.83.150.199 23 2>&1 | grep IPv4
nc -w 5 212.83.150.199 23 2>&1 | grep Host
# check nc???

#delete route
ip r del 212.83.150.199/32
