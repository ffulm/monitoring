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

count=1
tout=1
addr4=8.8.8.8
addr6=0::

##########################
#ping4
time=$(ping -c $count -W $tout $addr4 | grep round-trip | awk -F/ '{print $5}')

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
time=$(ping -c $count -W $tout $addr6 | grep round-trip | awk -F/ '{print $5}')

#if: check if there is a value from the ping command. else: send warning
if [$time == ""]
then
  echo \"ping4status\": \"bad\", >> tmp.json

else
  echo \"ping4status\": \"good\", >> tmp.json

fi

#output of the avg value with transfer to the json file
echo \"ping4time\": \"$time\", >> tmp.json


##########################
