#!/bin/bash

## 03.2018, Jan Hermann, freifunk@jan-hermann.de
##
## Version 1.0
##
## create json-File
## call subscripts for checkups


echo [ > tmp.json
echo { >> tmp.json

echo \"name\": \"vpn1\", >> tmp.json

## check-scripts
./ping.sh #übergabewerte!


./speedtest.sh


### status

echo \"status\": \"$tmpstat\", >> tmp.json
echo }, >> tmp.json

### timestamp
echo { >> tmp.json
ts=$(date | awk '{print $2,$3,$6" -",$4}')
echo \"timestamp\": \"$ts\" >> tmp.json
echo } >> tmp.json

## close json
echo ] >> tmp.json

## move to data from tmp-file
mv tmp.json data.json
