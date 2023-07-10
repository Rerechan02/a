#!/bin/bash
#installer Websocker tunneling 
cd

wget -O /usr/local/bin/ws-stunnel https://raw.githubusercontent.com/Rerechan02/a/main/sshws/ws-stunnel

#izin permision
chmod +x /usr/local/bin/ws-stunnel

#System SSL/TLS Websocket-SSH Python
wget -O /etc/systemd/system/ws-stunnel.service https://raw.githubusercontent.com/Rerechan02/a/main/sshws/ws-stunnel.service && chmod +x /etc/systemd/system/ws-stunnel.service
#restart service
#
systemctl daemon-reload
#Enable & Start & Restart ws-openssh service
#systemctl enable ws-openssh.service
#systemctl start ws-openssh.service
#systemctl restart ws-openssh.service
#Enable & Start & Restart ws-openssh service
systemctl enable ws-stunnel.service
systemctl start ws-stunnel.service
systemctl restart ws-stunnel.service

clear