Freifunk Ulm Monitoring Scripts:

Status check:

Script: freifunk_network.sh

Voraussetzungen:
  - http://github.com/pixelb/scripts/commits/master/scripts/ansi2html.sh
  - apt-get install dhcping netcat dnsutils gawk

Aufruf: freifunk_network.sh | ansi2html.sh > index.html


Speed check:

Script:
 - freifunk_speed_header.sh
 - freifunk_speed_footer.sh

Voraussetzungen:
 - https://raw.github.com/sivel/speedtest-cli/master/speedtest_cli.py

Aufruf:
 freifunk_speed_header.sh | ansi2html.sh > index.html
 speedtest-cli | ansi2html.sh >> index.html
 freifunk_speed_footer.sh | ansi2html.sh >> index.html
