#!/bin/bash

## 03.2018, Jan Hermann, freifunk@jan-hermann.de
##
## Version 1.0
##
## require speedtest-cli -> apt-get install speedtest-cli
##
## This script must be able to create, edit and delete files
## in its own directory

## run speedtest and save data to temp-File
speedtest-cli | grep -A 3 Download > speed.tmp

## read temp-file and write to tmp.json
echo { >> tmp.json
# read Download-data from speed.tmp and write into json-file
tD=$(grep Download < speed.tmp | awk '{print $2,$3}')
echo \"Download\": \"$tD\", >> tmp.json
# read Upload-data and write into json-file
tU=$(grep Upload < speed.tmp | awk '{print $2,$3}')
echo \"Upload\": \"$tU\" >> tmp.json

echo } >> tmp.json
