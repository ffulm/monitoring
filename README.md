## Monitoring for FFulm

The purpose of this project is to have a simple way of monitoring the Freifunk Ulm Network.

Therefore, this tool contains two parts:
1. shell based script that connects to the vpn-nodes and determines the status to dump in into a json file
2. html file that reads the json file and displays it using javascript and css


------
ToDo's:
* Hintergrund hinter Logo weiß machen ohne Rand

* Knotenanzahl in Page einbauen (Infos stehen in der Karte) -> https://map.freifunk-ulm.de/data/graph.json; https://map.freifunk-ulm.de/data/nodes.json

* Userzahl in Page einbauen (Infos stehen in der Karte)

* Auswertung (Statistik, welche Routermodelle eingesetzt werden)(Infos stehen in der Karte)

* Übergabewerte für die Scripte: Externe Tabellen befüllen mit den Servern und Routen, etc

* zentrales Config-File für alle Module: zB Ping: Counter, Wartezeit, ...

* dhcp-check-Modul: dhcpcheck.sh

* nslookup-Modul: nslookup.sh

* Dokumentation!

* JSON Generierung durch mehrere Rechner, Anzeige des Status aus mehreren verschiedenen JSON Dateien
