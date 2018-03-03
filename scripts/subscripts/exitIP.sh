#!/bin/bash

##
##Adressen aus Freifunk-Skript

ip r add 212.83.150.199/32 via 10.33.64.1

eip=$(ip r l | grep 212.83.150.199 | awk '{print $1}')

echo \"exitip4route\": \"$eip\", >> tmp.json



# was macht nc???
