echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "NSDomain anda saat ini:"
echo -e "$(cat /etc/xray/nsdomain)"
echo -e ""
read -rp "NSDomain: " -e NS_DOMAIN
clear
echo $NS_DOMAIN >/etc/xray/dns
echo $NS_DOMAIN >/etc/xray/nsdomain
echo $NS_DOMAIN >/etc/slowdns/nsdomain
cd
	mkdir -p /etc/slowdns
	wget -O dnstt-server "https://raw.githubusercontent.com/Rerechan02/v/main/wireguard/dnstt-server" >/dev/null 2>&1
	chmod +x dnstt-server >/dev/null 2>&1
	wget -O dnstt-client "https://raw.githubusercontent.com/Rerechan02/v/main/wireguard/dnstt-client" >/dev/null 2>&1
	chmod +x dnstt-client >/dev/null 2>&1
	./dnstt-server -gen-key -privkey-file server.key -pubkey-file server.pub
	chmod +x *
	mv * /etc/slowdns
	wget -O /etc/systemd/system/client.service "https://raw.githubusercontent.com/Rerechan02/v/main/wireguard/client" >/dev/null 2>&1
	wget -O /etc/systemd/system/server.service "https://raw.githubusercontent.com/Rerechan02/v/main/wireguard/server" >/dev/null 2>&1
	sed -i "s/xxxx/$NS_DOMAIN/g" /etc/systemd/system/client.service 
	sed -i "s/xxxx/$NS_DOMAIN/g" /etc/systemd/system/server.service
	echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "SUCCSES CHANGE NS DOMAIN SLOWDNS"
echo ""
read -n 1 -s -r -p "Press any key to back menu"
menu