#!/bin/bash

## erzeugt das json-File
## ruft die anderen Tools auf, die das File ergänzen


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

## übergabe der tmp an data
mv tmp.json data.json
