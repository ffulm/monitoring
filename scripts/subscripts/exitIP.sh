#!/bin/bash

##
##Adressen aus Freifunk-Skript

ip r add 212.83.150.199/32 via 10.33.64.1

eip=$(ip r l | grep 212.83.150.199 | awk '{print $1}')

echo \"exitip4route\": \"$eip\", >> tmp.json

nc -w 5 212.83.150.199 23 2>&1 | grep IPv4
nc -w 5 212.83.150.199 23 2>&1 | grep Host
# was macht nc???

#route löschen
ip r del 212.83.150.199/32
