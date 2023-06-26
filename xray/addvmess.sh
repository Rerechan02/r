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
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | lolcat
echo -e "                 • FunnyVpn •                 "
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | lolcat
domain=$(cat /etc/xray/domain)
tls="$(cat ~/log-install.txt | grep -w "XRAYS Vmess TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "XRAYS Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username : " -e user
		CLIENT_EXISTS=$(grep -wE "^### ${user}" "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 2 |  wc -l)

		if [[ ${CLIENT_EXISTS} -ge '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmess$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vmessgrpc$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
cat>/etc/xray/vmess-$user-tls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/xrayvws",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF
cat>/etc/xray/vmess-$user-nontls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${none}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/xrayvws",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF
cat>/etc/xray/vmess-$user-grpc.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "vmess-grpc",
      "type": "gun",
      "host": "${domain}",
      "tls": "tls"
}
EOF

## ubah config ke base64
vmess_base641=$( base64 -w 0 <<< $vmess_json1 )
vmess_base642=$( base64 -w 0 <<< $vmess_json2 )
vmess_base643=$( base64 -w 0 <<< $vmess_json3 )
xrayv2ray1="vmess://$(base64 -w 0 /etc/xray/vmess-$user-tls.json)"
xrayv2ray2="vmess://$(base64 -w 0 /etc/xray/vmess-$user-nontls.json)"
xrayv2ray3="vmess://$(base64 -w 0 /etc/xray/vmess-$user-grpc.json)"
systemctl restart xray.service
systemctl restart xray
service cron restart
clear
echo -e "══════════════════════════"                 
echo -e "    <=  VMESS ACCOUNT =>"       
echo -e "══════════════════════════"                 
echo -e ""                
echo -e "Username     : $user"
echo -e "CITY         : $(cat /root/.mycity)"
echo -e "ISP          : $(cat /root/.myisp)"
echo -e "Port ssl/tls : 443"
echo -e "Port non tls : 80"                                        
echo -e "Key          : $uuid"
echo -e "Network      : ws, grpc"
echo -e "Path         : /xrayvws"
echo -e "serviceName  : vmess-grpc"               
echo -e ""  
echo -e "══════════════════════════"                 
echo -e "Link Tls  => ${xrayv2ray1}"
echo -e "══════════════════════════"                 
echo -e "Link None => ${xrayv2ray2}"
echo -e "══════════════════════════"                 
echo -e "Link Grpc => ${xrayv2ray3}"
echo -e "══════════════════════════"                 
echo -e "   Expired => $exp"
echo -e "══════════════════════════"                 
read -n 1 -s -r -p "Press any key to back on menu"
menu