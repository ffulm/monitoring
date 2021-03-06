#!/bin/bash

## 03.2018, Jan Hermann, freifunk@jan-hermann.de
##
## Version 1.0
##
##ToDo: ToDo: Set up a warning if the ping runtime is too long
##
## addr = target (v4 and v6)
## count = number of pings
## tout = waite until timeout in s
## time = Result: output of the return value: avg

# readd config-file
FILE="./cfg/config.cfg"
. $FILE

##########################
#ping4
time=$(ping -c $cPing -W $tout $addr4ping | grep round-trip | awk -F/ '{print $5}')

#if: check if there is a value from the ping command. else: send warning
if [$time == ""]
then
  echo \"ping4status\": \"bad\", >> tmp.json

else
  echo \"ping4status\": \"good\", >> tmp.json

fi

# output of the avg value with transfer to the json file
echo \"ping4time\": \"$time\", >> tmp.json

###########################
###########################
#ping6
time=$(ping -c $cPing -W $tout $addr6ping | grep round-trip | awk -F/ '{print $5}')

#if: check if there is a value from the ping command. else: send warning
if [$time == ""]
then
  echo \"ping6status\": \"bad\", >> tmp.json

else
  echo \"ping6status\": \"good\", >> tmp.json

fi

#output of the avg value with transfer to the json file
echo \"ping4time\": \"$time\", >> tmp.json


##########################
