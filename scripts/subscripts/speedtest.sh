#!/bin/bash

## require speedtest-cli
##

## run speedtest and save data to temp-File

speedtest-cli | grep -A 3 Download > speed.tmp

## read temp-file and write to tmp.json
echo { >> tmp.json

tD=$(grep Download < speed.tmp | awk '{print $2,$3}')
echo \"Download\": \"$tD\", >> tmp.json

tU=$(grep Upload < speed.tmp | awk '{print $2,$3}')
echo \"Upload\": \"$tU\" >> tmp.json

echo } >> tmp.json
