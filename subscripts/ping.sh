#!/bin/bash

##ping
##
##ToDo: Warning einrichten bei zu langer Ping-Laufzeit
##
## addr = ziel (v4 und v6)
## count = anzahl der pings
## tout = wartezeit bis abbruch in s
## time = Ergebnis: avg des ping

count=1
tout=1
addr4=8.8.8.8
addr6=0::

##########################
#ping4
time=$(ping -c $count -W $tout $addr4 | grep round-trip | awk -F/ '{print $5}')

#if zeit da-> good, sonst bad
if [$time == ""]
then
  echo \"ping4status\": \"bad\", >> data.json

else
  echo \"ping4status\": \"good\", >> data.json

fi

#ausgabe der avg-time in das json-file
echo \"ping4time\": \"$time\", >> data.json

###########################
###########################
#ping6
time=$(ping -c $count -W $tout $addr6 | grep round-trip | awk -F/ '{print $5}')

#if zeit da-> good, sonst bad
if [$time == ""]
then
  echo \"ping4status\": \"bad\", >> data.json

else
  echo \"ping4status\": \"good\", >> data.json

fi

#ausgabe der avg-time in das json-file
echo \"ping4time\": \"$time\", >> data.json


##########################
