#!/bin/bash
# ==========================================
#########################
#SETUP ALL INFORMATION
curl ipinfo.io/org > /root/.isp
curl ipinfo.io/city > /root/.city
curl ipinfo.io/org > /root/.myisp
curl ipinfo.io/city > /root/.mycity
curl ifconfig.me > /root/.ip
curl ipinfo.io/region > /root/.region
clear
mkdir -p /etc/xray
mkdir -p /etc/v2ray
mkdir -p /etc/slowdns
mkdir -p /etc/udp
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/scdomain
touch /etc/v2ray/scdomain
clear
read -rp "Input your subdomain : " -e pp
echo "$pp" > /root/domain
echo "$pp" > /root/scdomain
echo "$pp" > /etc/xray/domain
echo "$pp" > /etc/xray/scdomain
echo "IP=$pp" > /var/lib/ipvps.conf
echo ""
clear
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Link Hosting Kalian Untuk Ssh Vpn
bzvpn="raw.githubusercontent.com/Rerechan02/r/main/ssh"
# Link Hosting Kalian Untuk Xray
bzvpnnnnnn="raw.githubusercontent.com/Rerechan02/r/main/xray"
# Link Hosting Kalian Untuk Backup
bzvpnnnnnnnn="raw.githubusercontent.com/Rerechan02/r/main/backup"
# Link Hosting Kalian Untuk Websocket
bzvpnnnnnnnnn="raw.githubusercontent.com/Rerechan02/r/main/websocket"
# Link Hosting Kalian Untuk Ohp
bzvpnnnnnnnnnn="raw.githubusercontent.com/Rerechan02/r/main/ohp"

clear
sleep 1
echo -e ""
sleep 2
mkdir /var/lib/bzstorevpn;
echo "IP=" >> /var/lib/bzstorevpn/ipvps.conf
wget https://${bzvpn}/cf.sh && chmod +x cf.sh && ./cf.sh
#install v2ray
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m          ⇱ INSTALL V2RAY ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
sleep 2
wget https://${bzvpnnnnnn}/ins-xray.sh && chmod +x ins-xray.sh && screen -S xray ./ins-xray.sh
#install ssh ovpn
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m          ⇱ INSTALL SSH-CDN ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
sleep 2
wget https://${bzvpn}/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
wget https://${bzvpnnnnnnnn}/set-br.sh && chmod +x set-br.sh && ./set-br.sh
# Websocket
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m          ⇱ INSTALL WEBSOCKET ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
sleep 2
wget https://${bzvpnnnnnnnnn}/websocket.sh && chmod +x websocket.sh && ./websocket.sh
# Ohp Server
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m          ⇱ INSTALL OHP ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
sleep 2
wget https://${bzvpnnnnnnnnnn}/ohp.sh && chmod +x ohp.sh && ./ohp.sh
wget https://${bzvpnnnnnnnnnn}/ohp-dropbear.sh && chmod +x ohp-dropbear.sh && ./ohp-dropbear.sh
wget https://${bzvpnnnnnnnnnn}/ohp-ssh.sh && chmod +x ohp-ssh.sh && ./ohp-ssh.sh
rm -f /root/ssh-vpn.sh
rm -f /root/sstp.sh
rm -f /root/wg.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/ins-xray.sh
rm -f /root/ipsec.sh
rm -f /root/set-br.sh
rm -f /root/websocket.sh
rm -f /root/ohp.sh
rm -f /root/ohp-dropbear.sh
rm -f /root/ohp-ssh.sh
#rm -f /root/nameserver
cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=api

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
wget -O /etc/set.sh "https://${bzvpn}/set.sh"
chmod +x /etc/set.sh
history -c
echo "1.2" > /home/ver
echo " "
echo "Installation has been completed!!"
echo -e ""
sleep 2
echo " Reboot 15 Sec"
sleep 15
rm -f setup.sh
reboot
