iptables -D FORWARD -i wg0 -o wg0 -j REJECT
