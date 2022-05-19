#!/bin/bash
### BEGIN INIT INFO
# Provides:          iptables
# Required-Start:    mountvirtfs ifupdown $local_fs
# Default-Start:     S
# Default-Stop:      0 6
### END INIT INFO

 case "$1" in
 start)
	### DNS ###
	iptables -A INPUT -p udp --sport 53 -j ACCEPT
	iptables -A OUTPUT -p udp --sport 53 -j ACCEPT
	iptables -A INPUT -p udp --dport 53 -j ACCEPT
	iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
	### HTTP TCP 80 ###
	iptables -A INPUT -p tcp --sport 80 -j ACCEPT
	iptables -A OUTPUT -p tcp --sport 80 -j ACCEPT
	iptables -A INPUT -p tcp --dport 80 -j ACCEPT
	iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
	### HTTP UDP 80 ###
	iptables -A INPUT -p udp --sport 80 -j ACCEPT
	iptables -A OUTPUT -p udp --sport 80 -j ACCEPT
	iptables -A INPUT -p udp --dport 80 -j ACCEPT
	iptables -A OUTPUT -p udp --dport 80 -j ACCEPT
	### HTTPS ###
	iptables -A INPUT -p tcp --sport 443 -j ACCEPT
	iptables -A OUTPUT -p tcp --sport 443 -j ACCEPT
	iptables -A INPUT -p tcp --dport 443 -j ACCEPT
	iptables -A OUTPUT -p tcp --dport 443 -j ACCEPT
	### WILDFLY  ###
	iptables -A INPUT -p tcp --sport 8080 -j ACCEPT
	iptables -A OUTPUT -p tcp --sport 8080 -j ACCEPT
	iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
	iptables -A OUTPUT -p tcp --dport 8080 -j ACCEPT
	### TOMCAT ###
	iptables -A INPUT -p tcp --sport 8081 -j ACCEPT
	iptables -A OUTPUT -p tcp --sport 8081 -j ACCEPT
	iptables -A INPUT -p tcp --dport 8081 -j ACCEPT
	iptables -A OUTPUT -p tcp --dport 8081 -j ACCEPT
	### WILDFLY management ###
	iptables -A INPUT -p tcp --sport 9990 -j ACCEPT
	iptables -A OUTPUT -p tcp --sport 9990 -j ACCEPT
	iptables -A INPUT -p tcp --dport 9990 -j ACCEPT
	iptables -A OUTPUT -p tcp --dport 9990 -j ACCEPT
	### CUPS TCP ###
	iptables -A INPUT -p tcp --sport 631 -j ACCEPT
	iptables -A OUTPUT -p tcp --sport 631 -j ACCEPT
	iptables -A INPUT -p tcp --dport 631 -j ACCEPT
	iptables -A OUTPUT -p tcp --dport 631 -j ACCEPT
	### CUPS UDP ###
	iptables -A INPUT -p udp --sport 631 -j ACCEPT
	iptables -A OUTPUT -p udp --sport 631 -j ACCEPT
	iptables -A INPUT -p udp --dport 631 -j ACCEPT
	iptables -A OUTPUT -p udp --dport 631 -j ACCEPT
	### MySQL Server TCP ###
	iptables -A INPUT -p tcp --sport 3306 -j ACCEPT
	iptables -A OUTPUT -p tcp --sport 3306 -j ACCEPT
	iptables -A INPUT -p tcp --dport 3306 -j ACCEPT
	iptables -A OUTPUT -p tcp --dport 3306 -j ACCEPT
	### MySQL Server TCP ###
	iptables -A INPUT -p udp --sport 3306 -j ACCEPT
	iptables -A OUTPUT -p udp --sport 3306 -j ACCEPT
	iptables -A INPUT -p udp --dport 3306 -j ACCEPT
	iptables -A OUTPUT -p udp --dport 3306 -j ACCEPT
	### Admin console wildfly on http://127.0.0.1:9990
	iptables -A INPUT -p tcp --sport 9990 -j ACCEPT
	iptables -A OUTPUT -p tcp --sport 9990 -j ACCEPT
	iptables -A INPUT -p tcp --dport 9990 -j ACCEPT
	iptables -A OUTPUT -p tcp --dport 9990 -j ACCEPT

	### ADB 
	iptables -A INPUT -p tcp --sport 5037 -j ACCEPT
	iptables -A OUTPUT -p tcp --sport 5037 -j ACCEPT
	iptables -A INPUT -p tcp --dport 5037 -j ACCEPT
	iptables -A OUTPUT -p tcp --dport 5037 -j ACCEPT

	#### TORRENT TCP ###
	iptables -A INPUT -p tcp --sport 1337 -j ACCEPT
	iptables -A OUTPUT -p tcp --sport 1337 -j ACCEPT
	iptables -A INPUT -p tcp --dport 1337 -j ACCEPT
	iptables -A OUTPUT -p tcp --dport 1337 -j ACCEPT

	iptables -A INPUT -p tcp --sport 3310 -j ACCEPT
	iptables -A OUTPUT -p tcp --sport 3310 -j ACCEPT
	iptables -A INPUT -p tcp --dport 3310 -j ACCEPT
	iptables -A OUTPUT -p tcp --dport 3310 -j ACCEPT

	iptables -A INPUT -p tcp --source-port 6881:6999 -j ACCEPT
	iptables -A OUTPUT -p tcp --source-port 6881:6999 -j ACCEPT
	iptables -A INPUT -p tcp --destination-port 6881:6999 -j ACCEPT
	iptables -A OUTPUT -p tcp --destination-port 6881:6999 -j ACCEPT
	#### TORRENT UDP ###
	iptables -A INPUT -p udp --source-port 6881:6999 -j ACCEPT
	iptables -A OUTPUT -p udp --source-port 6881:6999 -j ACCEPT
	iptables -A INPUT -p udp --destination-port 6881:6999 -j ACCEPT
	iptables -A OUTPUT -p udp --destination-port 6881:6999 -j ACCEPT
	### Gradle TCP ###
	iptables -A INPUT -p tcp --source-port 38000:55000 -j ACCEPT
	iptables -A OUTPUT -p tcp --source-port 38000:55000 -j ACCEPT
	iptables -A INPUT -p tcp --destination-port 38000:55000 -j ACCEPT
	iptables -A OUTPUT -p tcp --destination-port 38000:55000 -j ACCEPT
	### ICMP ###
	iptables -A OUTPUT -p icmp -j ACCEPT
	iptables -A INPUT -p icmp -j ACCEPT
	### NEGA TUDO ###
	iptables -A OUTPUT -j DROP
	iptables -A INPUT -j DROP
	iptables -A FORWARD -j DROP
	 echo "Firewall [START]";
    ;;

 stop)
	iptables -X
	iptables -F
	 echo "Firewall [STOP]";
    ;;

 status)
	echo "Firewall [STATUS]";
	iptables -L -n
    ;;

 *)
    echo "Usage: afirewall {start|stop|status}"
    exit 1
    ;;
 esac

exit 0
