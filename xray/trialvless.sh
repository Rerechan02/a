domain=$(cat /etc/xray/domain)
sldomain=`cat /etc/xray/dns`
slkey=`cat /etc/slowdns/server.pub`
tls="$(cat ~/log-install.txt | grep -w "Vless TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vless None TLS" | cut -d: -f2|sed 's/ //g')"
user=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
uuid=$(cat /proc/sys/kernel/random/uuid)
masaaktif=1
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
sed -i '/#vless$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
vlesslink1="vless://${uuid}@${domain}:443?path=/vless&security=tls&encryption=none&host=${domain}&type=ws&sni=${domain}#${user}"
vlesslink2="vless://${uuid}@${domain}:80?path=/vless&security=none&encryption=none&host=${domain}&type=ws#${user}"
vlesslink3="vless://${uuid}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=${domain}#${user}"
dns="vless://${uuid}@${sldomain}:443?path=/vless&security=tls&encryption=none&host=${domain}&type=ws&sni=${domain}#${user}"
systemctl restart xray
clear
echo -e "══════════════════════════"                 
echo -e "    <=  VLESS ACCOUNT =>"       
echo -e "══════════════════════════"                 
echo -e ""                
echo -e "Username     : $user"
echo -e "CITY         : $(cat /root/.mycity)"
echo -e "ISP          : $(cat /root/.myisp)"
echo -e "Host/IP      : $(cat /etc/xray/domain)"
echo -e "NSDOMAIN     : $(cat /etc/xray/dns)"
echo -e "PUBKEY       : $(cat /etc/slowdns/server.pub)"
echo -e "Slowdns      : 53, 5300"
echo -e "Port tls/ssl : 777, 8443, 444, 442, 443, 2096, 88443, 4433"
echo -e "Port non tls : 80, 8080, 8880, 8000, 2082, 109, 69, 143"
echo -e "Key          : $uuid"
echo -e "Network      : ws, grpc"
echo -e "Path TLS     : /vless"
echo -e "serviceName  : vless-grpc"               
echo -e ""  
echo -e "══════════════════════════"                 
echo -e "Link Tls  => ${vlesslink1}"
echo -e "══════════════════════════"                 
echo -e "Link None => ${vlesslink2}"
echo -e "══════════════════════════"                 
echo -e "Link Grpc => ${vlesslink3}"
echo -e "══════════════════════════"                 
echo -e "Link Dns  => ${dns}"
echo -e "══════════════════════════"                 
echo -e "   Expired => $exp"
echo -e "══════════════════════════"                 
read -n 1 -s -r -p "Press any key to back on menu"

menu
