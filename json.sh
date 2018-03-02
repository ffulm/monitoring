#!/bin/bash

## erzeugt das json-File
## ruft die anderen Tools auf, die das File ergänzen


echo [ > data.json

echo { >> data.json

echo \"name\": \"vpn1\", >> data.json


./ping.sh #übergabewerte!


echo ] >> data.json
