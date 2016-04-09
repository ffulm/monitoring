#!/bin/bash

#enable / disable server monitoring
vpn1_dhcp_v4="1"
vpn1_exitip_v4="1"
vpn1_inet_v4="1"
vpn1_inet_v6="1"
vpn1_dns_v4="1"
vpn1_dns_v6="1"

vpn2_dhcp_v4="1"
vpn2_exitip_v4="1"
vpn2_inet_v4="1"
vpn2_inet_v6="1"
vpn2_dns_v4="1"
vpn2_dns_v6="1"

vpn3_dhcp_v4="1"
vpn3_exitip_v4="1"
vpn3_inet_v4="1"
vpn3_inet_v6="0"
vpn3_dns_v4="1"
vpn3_dns_v6="1"

vpn4_dhcp_v4="1"
vpn4_exitip_v4="1"
vpn4_inet_v4="1"
vpn4_inet_v6="1"
vpn4_dns_v4="1"
vpn4_dns_v6="1"

vpn5_dhcp_v4="1"
vpn5_exitip_v4="1"
vpn5_inet_v4="1"
vpn5_inet_v6="1"
vpn5_dns_v4="1"
vpn5_dns_v6="1"

vpn6_dhcp_v4="1"
vpn6_exitip_v4="1"
vpn6_inet_v4="1"
vpn6_inet_v6="1"
vpn6_dns_v4="1"
vpn6_dns_v6="1"


echo -e "\033[0;34m>>>>> Freifunk Ulm Gateway check --- $(date) <<<<<\033[0m"
echo ""
echo "-------------------------------------------"
echo ""

echo -e "\033[0;34m>>>>> vpn1.freifunk-ulm.de <<<<<\033[0m"
echo ""
echo -e "\033[0;36m>>>>> dhcp check v4 (dhcp request) via vpn1\033[0m"
if [ $vpn1_dhcp_v4 == "1" ]; then
        /usr/sbin/dhcping -s 10.33.64.1 -c 10.33.99.1 -h 00:11:22:33:44:55
        if [ $? -ne 0 ]; then
                echo "ffulm dhcp error vpn1"
        fi
else
        echo "DISABLED"
fi
echo ""

echo -e "\033[0;36m>>>>> exit ip v4 via vpn1\033[0m"
if [ $vpn1_exitip_v4 == "1" ]; then
        ip r add 212.83.150.199/32 via 10.33.64.1
        echo -n "route: "
        ip r l | grep 212.83.150.199
        nc -w 5 212.83.150.199 23 2>&1 | grep IPv4
        nc -w 5 212.83.150.199 23 2>&1 | grep Host
        ip r del 212.83.150.199/32
else
        echo "DISABLED"
fi
echo ""

echo -e "\033[0;36m>>>>> internet check v4 (ping 208.67.222.222) via vpn1\033[0m"
if [ $vpn1_inet_v4 == "1" ]; then
        ip r add 208.67.222.222/32 via 10.33.64.1
        echo -n "route: "
        ip r l | grep 208.67.222.222
        ping -c3 208.67.222.222
        if [ $? -ne 0 ]; then
                echo "!!! Ping Error !!!"
        fi
        ip r del 208.67.222.222/32
else
        echo "DISABLED"
fi
echo ""

echo -e "\033[0;36m>>>>> internet check v6 (ping6 2620:0:ccc::2) via vpn1\033[0m"
if [ $vpn1_inet_v6 == "1" ]; then
        ip -6 r add 2620:0:ccc::2/128 via fdef:17a0:fff1:300:5254:a2ff:fe01:1f1d
        echo -n "route: "
        ip -6 r l | grep 2620:0:ccc::2
        ping6 -c3 2620:0:ccc::2 2>&1
        if [ $? -ne 0 ]; then
                echo "!!! Ping Error !!!"
        fi
        ip -6 r del 2620:0:ccc::2/128
else
        echo "DISABLED"
fi
echo ""

echo -e "\033[0;36m>>>>> dns4 vpn1 zone ffulm (nslookup vpn1.ffulm 10.33.64.1)\033[0m"
if [ $vpn1_dns_v4 == "1" ]; then
        nslookup vpn1.ffulm 10.33.64.1 | tail -n 3
else
        echo "DISABLED"
fi

echo -e "\033[0;36m>>>>> dns4 vpn1 internet (nslookup ipv4.google.com 10.33.64.1)\033[0m"
if [ $vpn1_dns_v4 == "1" ]; then
        nslookup ipv4.google.com 10.33.64.1 | tail -n 3
else
        echo "DISABLED"
fi

echo -e "\033[0;36m>>>>> dns6 vpn1 internet (nslookup ipv6.google.com fdef:17a0:fff1:300:5254:a2ff:fe01:1f1d)\033[0m"
if [ $vpn1_dns_v6 == "1" ]; then
        nslookup ipv6.google.com fdef:17a0:fff1:300:5254:a2ff:fe01:1f1d
else
        echo "DISABLED"
fi
echo ""
echo "-------------------------------------------"
echo ""

echo -e "\033[0;34m>>>>> vpn2.freifunk-ulm.de <<<<<\033[0m"
echo ""
echo -e "\033[0;36m>>>>> dhcp check v4 (dhcp request) via vpn2\033[0m"
if [ $vpn2_dhcp_v4 == "1" ]; then
        /usr/sbin/dhcping -s 10.33.68.1 -c 10.33.99.1 -h 00:11:22:33:44:55
        if [ $? -ne 0 ]; then
                echo "ffulm dhcp error vpn2"
        fi
else
        echo "DISABLED"
fi
echo ""

echo -e "\033[0;36m>>>>> exit ip v4 via vpn2\033[0m"
if [ $vpn2_exitip_v4 == "1" ]; then
        ip r add 212.83.150.199/32 via 10.33.68.1
        echo -n "route: "
        ip r l | grep 212.83.150.199
        nc -w 5 212.83.150.199 23 2>&1 | grep IPv4
        nc -w 5 212.83.150.199 23 2>&1 | grep Host
        ip r del 212.83.150.199/32
else
        echo "DISABLED"
fi
echo ""

echo -e "\033[0;36m>>>>> internet check v4 (ping 208.67.222.222) via vpn2\033[0m"
if [ $vpn2_inet_v4 == "1" ]; then
        ip r add 208.67.222.222/32 via 10.33.68.1
        ip r l | grep 208.67.222.222
        ping -c3 208.67.222.222
        if [ $? -ne 0 ]; then
                echo "!!! Ping Error !!!"
        fi
        ip r del 208.67.222.222/32
else
        echo "DISABLED"
fi
echo ""

echo -e "\033[0;36m>>>>> internet check v6 (ping6 2620:0:ccc::2) via vpn2\033[0m"
if [ $vpn2_inet_v6 == "1" ]; then
        ip -6 r add 2620:0:ccc::2/128 via fdef:17a0:fff1:300:1c:14ff:fe01:6d
        echo -n "route: "
        ip -6 r l | grep 2620:0:ccc::2
        ping6 -c3 2620:0:ccc::2 2>&1
        if [ $? -ne 0 ]; then
                echo "!!! Ping Error !!!"
        fi
        ip -6 r del 2620:0:ccc::2/128
else
        echo "DISABLED"
fi
echo ""

echo -e "\033[0;36m>>>>> dns4 vpn2 zone ffulm (nslookup vpn2.ffulm 10.33.68.1)\033[0m"
if [ $vpn2_dns_v4 == "1" ]; then
        nslookup vpn2.ffulm 10.33.68.1 | tail -n 3
else
        echo "DISABLED"
fi

echo -e "\033[0;36m>>>>> dns4 vpn2 internet (nslookup ipv4.google.com 10.33.68.1)\033[0m"
if [ $vpn2_dns_v4 == "1" ]; then
        nslookup ipv4.google.com 10.33.68.1 | tail -n 3
else
        echo "DISABLED"
fi

echo -e "\033[0;36m>>>>> dns6 vpn2 internet (nslookup ipv6.google.com fdef:17a0:fff1:300:1c:14ff:fe01:6d)\033[0m"
if [ $vpn2_dns_v6 == "1" ]; then
        nslookup ipv6.google.com fdef:17a0:fff1:300:1c:14ff:fe01:6d
else
        echo "DISABLED"
fi
echo ""
echo "-------------------------------------------"
echo ""

echo -e "\033[0;34m>>>>> vpn3.freifunk-ulm.de <<<<<\033[0m"
echo ""
echo -e "\033[0;36m>>>>> dhcp check v4 (dhcp request) via vpn3\033[0m"
if [ $vpn3_dhcp_v4 == "1" ]; then
	/usr/sbin/dhcping -s 10.33.72.1 -c 10.33.99.1 -h 00:11:22:33:44:55
	if [ $? -ne 0 ]; then
		echo "ffulm dhcp error vpn3"
	fi
else
	echo "DISABLED"
fi
echo ""

echo -e "\033[0;36m>>>>> exit ip v4 via vpn3\033[0m"
if [ $vpn3_exitip_v4 == "1" ]; then
        ip r add 212.83.150.199/32 via 10.33.72.1
        echo -n "route: "
        ip r l | grep 212.83.150.199
        nc -w 5 212.83.150.199 23 2>&1 | grep IPv4
        nc -w 5 212.83.150.199 23 2>&1 | grep Host
        ip r del 212.83.150.199/32
else
        echo "DISABLED"
fi
echo ""

echo -e "\033[0;36m>>>>> internet check v4 (ping 208.67.222.222) via vpn3\033[0m"
if [ $vpn3_inet_v4 == "1" ]; then
        ip r add 208.67.222.222/32 via 10.33.72.1
        echo -n "route: "
        ip r l | grep 208.67.222.222
        ping -c3 208.67.222.222
        if [ $? -ne 0 ]; then
                echo "!!! Ping Error !!!"
        fi
        ip r del 208.67.222.222/32
else
        echo "DISABLED"
fi
echo ""

echo -e "\033[0;36m>>>>> internet check v6 (ping6 2620:0:ccc::2) via vpn3\033[0m"
if [ $vpn3_inet_v6 == "1" ]; then
        ip -6 r add 2620:0:ccc::2/128 via fdef:17a0:fff1:300:50:56ff:fe00:6e00
        echo -n "route: "
        ip -6 r l | grep 2620:0:ccc::2
        ping6 -c3 2620:0:ccc::2 2>&1
        if [ $? -ne 0 ]; then
                echo "!!! Ping Error !!!"
        fi
        ip -6 r del 2620:0:ccc::2/128
else
        echo "DISABLED"
fi
echo ""

echo -e "\033[0;36m>>>>> dns4 vpn3 zone ffulm (nslookup vpn3.ffulm 10.33.72.1)\033[0m"
if [ $vpn3_dns_v4 == "1" ]; then
	nslookup vpn3.ffulm 10.33.72.1 | tail -n 3
else
        echo "DISABLED"
fi

echo -e "\033[0;36m>>>>> dns4 vpn3 internet (nslookup ipv4.google.com 10.33.72.1)\033[0m"
if [ $vpn3_dns_v4 == "1" ]; then
	nslookup ipv4.google.com 10.33.72.1 | tail -n 3
else
        echo "DISABLED"
fi

echo -e "\033[0;36m>>>>> dns6 vpn3 internet (nslookup ipv6.google.com 10.33.72.1)\033[0m"
if [ $vpn3_dns_v6 == "1" ]; then
	nslookup ipv6.google.com fdef:17a0:fff1:300:50:56ff:fe00:6e00
else
        echo "DISABLED"
fi
echo ""
echo "-------------------------------------------"
echo ""

echo -e "\033[0;34m>>>>> vpn4.freifunk-ulm.de <<<<<\033[0m"
echo ""
echo -e "\033[0;36m>>>>> dhcp check v4 (dhcp request) via vpn4\033[0m"
if [ $vpn4_dhcp_v4 == "1" ]; then
        /usr/sbin/dhcping -s 10.33.76.1 -c 10.33.99.1 -h 00:11:22:33:44:55
        if [ $? -ne 0 ]; then
                echo "ffulm dhcp error vpn4"
        fi
else
        echo "DISABLED"
fi
echo ""

echo -e "\033[0;36m>>>>> exit ip v4 via vpn4\033[0m"
if [ $vpn4_exitip_v4 == "1" ]; then
        ip r add 212.83.150.199/32 via 10.33.76.1
        echo -n "route: "
        ip r l | grep 212.83.150.199
        nc -w 5 212.83.150.199 23 2>&1 | grep IPv4
        nc -w 5 212.83.150.199 23 2>&1 | grep Host
        ip r del 212.83.150.199/32
else
        echo "DISABLED"
fi
echo ""

echo -e "\033[0;36m>>>>> internet check v4 (ping 208.67.222.222) via vpn4\033[0m"
if [ $vpn4_inet_v4 == "1" ]; then
        ip r add 208.67.222.222/32 via 10.33.76.1
        echo -n "route: "
        ip r l | grep 208.67.222.222
        ping -c3 208.67.222.222
        if [ $? -ne 0 ]; then
                echo "!!! Ping Error !!!"
        fi
        ip r del 208.67.222.222/32
else
        echo "DISABLED"
fi
echo ""

echo -e "\033[0;36m>>>>> internet check v6 (ping6 2620:0:ccc::2) via vpn4\033[0m"
if [ $vpn4_inet_v6 == "1" ]; then
        ip -6 r add 2620:0:ccc::2/128 via fdef:17a0:fff1:300:5254:a2ff:fe01:1f1e
        echo -n "route: "
        ip -6 r l | grep 2620:0:ccc::2
        ping6 -c3 2620:0:ccc::2 2>&1
        if [ $? -ne 0 ]; then
                echo "!!! Ping Error !!!"
        fi
        ip -6 r del 2620:0:ccc::2/128
else
        echo "DISABLED"
fi
echo ""

echo -e "\033[0;36m>>>>> dns4 vpn4 zone ffulm (nslookup vpn4.ffulm 10.33.76.1)\033[0m"
if [ $vpn4_dns_v4 == "1" ]; then
        nslookup vpn4.ffulm 10.33.76.1 | tail -n 3
else
        echo "DISABLED"
fi

echo -e "\033[0;36m>>>>> dns4 vpn4 internet (nslookup ipv4.google.com 10.33.76.1)\033[0m"
if [ $vpn4_dns_v4 == "1" ]; then
        nslookup ipv4.google.com 10.33.76.1 | tail -n 3
else
        echo "DISABLED"
fi

echo -e "\033[0;36m>>>>> dns6 vpn4 internet (nslookup ipv6.google.com fdef:17a0:fff1:300:5254:a2ff:fe01:1f1e)\033[0m"
if [ $vpn4_dns_v6 == "1" ]; then
        nslookup ipv6.google.com fdef:17a0:fff1:300:5254:a2ff:fe01:1f1e
else
        echo "DISABLED"
fi
echo ""
echo "-------------------------------------------"
echo ""

echo -e "\033[0;34m>>>>> vpn5.freifunk-ulm.de <<<<<\033[0m"
echo ""
echo -e "\033[0;36m>>>>> dhcp check v4 (dhcp request) via vpn5\033[0m"
if [ $vpn5_dhcp_v4 == "1" ]; then
	/usr/sbin/dhcping -s 10.33.80.1 -c 10.33.99.1 -h 00:11:22:33:44:55
	if [ $? -ne 0 ]; then
		echo "ffulm dhcp error vpn5"
	fi
else
        echo "DISABLED"
fi
echo ""

echo -e "\033[0;36m>>>>> exit ip v4 via vpn5\033[0m"
if [ $vpn5_exitip_v4 == "1" ]; then
        ip r add 212.83.150.199/32 via 10.33.80.1
        echo -n "route: "
        ip r l | grep 212.83.150.199
        nc -w 5 212.83.150.199 23 2>&1 | grep IPv4
        nc -w 5 212.83.150.199 23 2>&1 | grep Host
        ip r del 212.83.150.199/32
else
        echo "DISABLED"
fi
echo ""

echo -e "\033[0;36m>>>>> internet check v4 (ping 208.67.222.222) via vpn5\033[0m"
if [ $vpn5_inet_v4 == "1" ]; then
	ip r add 208.67.222.222/32 via 10.33.80.1
	echo -n "route: "
	ip r l | grep 208.67.222.222
	ping -c3 208.67.222.222
	if [ $? -ne 0 ]; then
		echo "!!! Ping Error !!!"
	fi
	ip r del 208.67.222.222/32
else
        echo "DISABLED"
fi
echo ""

echo -e "\033[0;36m>>>>> internet check v6 (ping6 2620:0:ccc::2) via vpn5\033[0m"
if [ $vpn5_inet_v6 == "1" ]; then
	ip -6 r add 2620:0:ccc::2/128 via fdef:17a0:fff1:300:0:d7ff:fe1f:5533
	echo -n "route: "
	ip -6 r l | grep 2620:0:ccc::2
	ping6 -c3 2620:0:ccc::2
	if [ $? -ne 0 ]; then
		echo "!!! Ping Error !!!"
	fi
	ip -6 r del 2620:0:ccc::2/128
else
        echo "DISABLED"
fi
echo ""

echo -e "\033[0;36m>>>>> dns4 vpn5 zone ffulm (nslookup vpn5.ffulm 10.33.80.1)\033[0m"
if [ $vpn5_dns_v4 == "1" ]; then
	nslookup vpn5.ffulm 10.33.80.1 | tail -n 3
else
        echo "DISABLED"
fi

echo -e "\033[0;36m>>>>> dns4 vpn5 internet (nslookup ipv4.google.com 10.33.80.1)\033[0m"
if [ $vpn5_dns_v4 == "1" ]; then
	nslookup ipv4.google.com 10.33.80.1 | tail -n 3
else
        echo "DISABLED"
fi

echo -e "\033[0;36m>>>>> dns6 vpn5 internet (nslookup ipv6.google.com fdef:17a0:fff1:300:0:d7ff:fe1f:5533)\033[0m"
if [ $vpn5_dns_v6 == "1" ]; then
	nslookup ipv6.google.com fdef:17a0:fff1:300:0:d7ff:fe1f:5533
else
        echo "DISABLED"
fi
echo ""
echo "-------------------------------------------"
echo ""

echo -e "\033[0;34m>>>>> vpn6.freifunk-ulm.de <<<<<\033[0m"
echo ""
echo -e "\033[0;36m>>>>> dhcp check v4 (dhcp request) via vpn6\033[0m"
if [ $vpn6_dhcp_v4 == "1" ]; then
	/usr/sbin/dhcping -s 10.33.84.1 -c 10.33.99.1 -h 00:11:22:33:44:55
	if [ $? -ne 0 ]; then
		echo "ffulm dhcp error vpn6"
	fi
else
        echo "DISABLED"
fi
echo ""

echo -e "\033[0;36m>>>>> exit ip v4 via vpn6\033[0m"
if [ $vpn6_exitip_v4 == "1" ]; then
	ip r add 212.83.150.199/32 via 10.33.84.1
        echo -n "route: "
        ip r l | grep 212.83.150.199
	nc -w 5 212.83.150.199 23 2>&1 | grep IPv4
        nc -w 5 212.83.150.199 23 2>&1 | grep Host
        ip r del 212.83.150.199/32
else
        echo "DISABLED"
fi
echo ""

echo -e "\033[0;36m>>>>> internet check v4 (ping 208.67.222.222) via vpn6\033[0m"
if [ $vpn6_inet_v4 == "1" ]; then
	ip r add 208.67.222.222/32 via 10.33.84.1
	echo -n "route: "
	ip r l | grep 208.67.222.222
	ping -c3 208.67.222.222
	if [ $? -ne 0 ]; then
		echo "!!! Ping Error !!!"
	fi
	ip r del 208.67.222.222/32
else
        echo "DISABLED"
fi
echo ""

echo -e "\033[0;36m>>>>> internet check v6 (ping6 2620:0:ccc::2) via vpn6\033[0m"
if [ $vpn6_inet_v6 == "1" ]; then
	ip -6 r add 2620:0:ccc::2/128 via fdef:17a0:fff1:300:faf4:f3ff:fed8:26a1
	echo -n "route: "
	ip -6 r l | grep 2620:0:ccc::2
	ping6 -c3 2620:0:ccc::2
	if [ $? -ne 0 ]; then
		echo "!!! Ping Error !!!"
	fi
	ip -6 r del 2620:0:ccc::2/128
else
        echo "DISABLED"
fi
echo ""

echo -e "\033[0;36m>>>>> dns4 vpn6 zone ffulm (nslookup vpn6.ffulm 10.33.84.1)\033[0m"
if [ $vpn6_dns_v4 == "1" ]; then
	nslookup vpn6.ffulm 10.33.84.1 | tail -n 3
else
        echo "DISABLED"
fi

echo -e "\033[0;36m>>>>> dns4 vpn6 internet (nslookup ipv4.google.com 10.33.84.1)\033[0m"
if [ $vpn6_dns_v4 == "1" ]; then
	nslookup ipv4.google.com 10.33.84.1 | tail -n 3
else
        echo "DISABLED"
fi

echo -e "\033[0;36m>>>>> dns6 vpn6 internet (nslookup ipv6.google.com fdef:17a0:fff1:300:faf4:f3ff:fed8:26a1)\033[0m"
if [ $vpn6_dns_v6 == "1" ]; then
	nslookup ipv6.google.com fdef:17a0:fff1:300:faf4:f3ff:fed8:26a1
else
        echo "DISABLED"
fi
echo ""
echo "-------------------------------------------"
echo ""

##check NAT64 on freifunk
##echo ">>>>> NAT64_check (ping6 resolver1.opendns.com vpn3)"
##route add -host 208.67.222.222 gw 10.33.72.1
##ip r l | grep 208.67.222.222
##ping6 -c1 resolver1.opendns.com | head -n 2
##route del -host 208.67.222.222

##echo ">>>>> NAT64_check (ping6 resolver1.opendns.com vpn5)"
##route add -host 208.67.222.222 gw 10.33.80.1
##ip r l | grep 208.67.222.222
##ping6 -c1 resolver1.opendns.com | head -n 2
##route del -host 208.67.222.222

##echo ">>>>> NAT64_check (ping6 resolver1.opendns.com vpn6)"
##route add -host 208.67.222.222 gw 10.33.84.1
##ip r l | grep 208.67.222.222
##ping6 -c1 resolver1.opendns.com | head -n 2
##route del -host 208.67.222.222

echo -e "\033[0;34m>>>>> ENDE <<<<<\033[0m"
