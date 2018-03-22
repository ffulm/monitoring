#!/bin/bash

## 03.2018, Jan Hermann, freifunk@jan-hermann.de
##
## Version 1.0
##
## create json-File
## call subscripts for checkups

# call setup-file
FILE="./cfg/config.cfg"
. $FILE #note the space between the dot and the leading slash of $FILE

# start json-tmp-File
echo [ > tmp.json

# for
for (( i = 1; i < $nos; i++ )); do

  #counter
  a=1

  echo { >> tmp.json
  echo \"name\": \"$name$a\", >> tmp.json

  ## check-scripts
  ./subscripts/ping.sh
  ./subscripts/nslookup.sh
  ./subscripts/exitIP.sh
  ./subscripts/dhcpCheck.sh
  ./subscripts/speedtest.sh


  ### status

  echo \"status\": \"$tmpstat\", >> tmp.json
  echo }, >> tmp.json

  a++
done

### timestamp
echo { >> tmp.json
ts=$(date | awk '{print $2,$3,$6" -",$4}')
echo \"timestamp\": \"$ts\" >> tmp.json
echo } >> tmp.json

## close json
echo ] >> tmp.json

## move to data from tmp-file
mv tmp.json data.json
