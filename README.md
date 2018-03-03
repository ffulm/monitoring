## Monitoring for FFulm

The purpose of this project is to have a simple way of monitoring the Freifunk Ulm Network.

Therefore, this tool contains two parts:
1. shell based script that connects to the vpn-nodes and determines the status to dump in into a json file
2. html file that reads the json file and displays it using javascript and css


------
ToDo's:
* Knotenanzahl in Page einbauen (Infos stehen in der Karte)

* Userzahl in Page einbauen (Infos stehen in der Karte)

* Auswertung (Statistik, welche Routermodelle eingesetzt werden)(Infos stehen in der Karte)

* Übergabewerte für die Scripte: Externe Tabellen befüllen mit den Servern und Routen, etc

* zentrales Config-File für alle Module: zB Ping: Counter, Wartezeit, ...

* dhcp-check-Modul: dhcpcheck.sh

* nslookup-Modul: nslookup.sh

* Dokumentation!
