#!/bin/bash
# My Telegram : https://t.me/anuybazoelk
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
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | lolcat
echo -e "                 • FunnyVpn •                 "
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | lolcat
domain=$(cat /etc/xray/domain)
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "Username : " -e user
		user_EXISTS=$(grep -wE "^#### ${user}" "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 2 | wc -l)

		if [[ ${user_EXISTS} -ge '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vless$/a\#### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
xrayvless1="vless://${uuid}@${domain}:$tls?path=/xrayws&security=tls&encryption=none&type=ws#${user}"
xrayvless2="vless://${uuid}@${domain}:$nontls?path=/xrayws&encryption=none&type=ws#${user}"
xrayvless3="vless://${uuid}@${domain}:$tls?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=${domain}#${user}"
systemctl restart xray.service
systemctl restart xray
service cron restart
clear
echo -e "══════════════════════════"                 
echo -e "    <=  VLESS ACCOUNT =>"       
echo -e "══════════════════════════"                 
echo -e ""                
echo -e "Username     : $user"
echo -e "CITY         : $(cat /root/.mycity)"
echo -e "ISP          : $(cat /root/.myisp)"
echo -e "Host/IP      : $(cat /etc/xray/domain)"
echo -e "Port tls/ssl : 443"
echo -e "Port non tls : 80"                
echo -e "Key          : $uuid"
echo -e "Network      : ws, grpc"
echo -e "Path TLS     : /xrayws"
echo -e "serviceName  : vless-grpc"               
echo -e ""  
echo -e "══════════════════════════"                 
echo -e "Link Tls  => ${xrayvless1}"
echo -e "══════════════════════════"                 
echo -e "Link None => ${xrayvless2}"
echo -e "══════════════════════════"                 
echo -e "Link Grpc => ${xrayvless3}"
echo -e "══════════════════════════"                 
echo -e "   Expired => $exp"
echo -e "══════════════════════════"                 
read -n 1 -s -r -p "Press any key to back on menu"
menu