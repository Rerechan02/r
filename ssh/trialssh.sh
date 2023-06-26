#!/bin/bash
# ==========================================
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
# Getting
clear
systemctl restart ws-tls
systemctl restart ws-nontls
systemctl restart ssh-ohp
systemctl restart dropbear-ohp
systemctl restart openvpn-ohp
Login=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=1
echo Ping Host
echo Check Acces...
sleep 0.5
echo Permission Accepted
clear
sleep 0.5
echo Create Acc: $Login
sleep 0.5
echo Setting Password: $Pass
sleep 0.5
clear
harini=`date -d "0 days" +"%Y-%m-%d"`
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
clear
echo -e "══════════════════════════"                 
echo -e "    <=  SSH ACCOUNT =>"       
echo -e "══════════════════════════"                 
echo -e ""
echo -e "Username     : $Login"
echo -e "Password     : $Pass"        
echo -e "CITY         : $(cat /root/.mycity)"
echo -e "ISP          : $(cat /root/.myisp)"
echo -e "Host/IP      : $(cat /etc/xray/domain)"
echo -e "Port ssl/tls : 443"
echo -e "Port non tls : 80, 8080, 109, 143"
echo -e "Udp Custom   : 1-6000, 500-6000"
echo -e "BadVpn       : 7200"      
echo -e ""  
echo -e "══════════════════════════"                 
echo -e "Payload Ws   => GET wss://$(cat /etc/xray/domain)/ HTTP/1.1[crlf]Host: $(cat /etc/xray/domain)[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "══════════════════════════"                 
echo -e "     Expired => $expi"
echo -e "══════════════════════════"
read -n 1 -s -r -p "Press any key to back on menu"
menu