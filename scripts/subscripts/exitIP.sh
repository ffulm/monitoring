#!/bin/bash

##
##Adressen aus Freifunk-Skript

ip r add 212.83.150.199/32 via 10.33.64.1

ip r l | grep 212.83.150.199 | awk '{print $1}'

# was macht nc???
