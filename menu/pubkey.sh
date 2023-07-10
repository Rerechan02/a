NS_DOMAIN=$(cat /etc/xray/nsdomain)
clear
rm -fr /etc/slowdns

	mkdir -p /etc/slowdns
	wget -O dnstt-server "https://github.com/myridwan/Autoscript-vps/raw/main/X-SlowDNS/dnstt-server" && chmod +x dnstt-server >/dev/null 2>&1
	wget -O dnstt-client "https://github.com/myridwan/Autoscript-vps/raw/main/X-SlowDNS/dnstt-client" && chmod +x dnstt-client >/dev/null 2>&1
	./dnstt-server -gen-key -privkey-file server.key -pubkey-file server.pub
	chmod +x *
	mv * /etc/slowdns
	wget -O /etc/systemd/system/client.service "https://github.com/myridwan/Autoscript-vps/raw/main/X-SlowDNS/client" >/dev/null 2>&1
	wget -O /etc/systemd/system/server.service "https://github.com/myridwan/Autoscript-vps/raw/main/X-SlowDNS/server" >/dev/null 2>&1
	sed -i "s/xxxx/$NS_DOMAIN/g" /etc/systemd/system/client.service 
	sed -i "s/xxxx/$NS_DOMAIN/g" /etc/systemd/system/server.service
	echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "SUCCSES Renew Pubkey & Private Key DNS TUNNEL"
read -n 1 -s -r -p "Press any key to back menu"
menu