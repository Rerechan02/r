clear  | tee -a log-install.txt
echo -e "\e[1;32m══════════════════ Autoscript PREMIUM ══════════════════\e[0m" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "    [INFORMASI SSH SERVICE PORT]" | tee -a log-install.txt
echo "    -------------------------" | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - Stunnel4                : 443"  | tee -a log-install.txt
echo "   - Udp Custom              : 7100-7900, 500-6000"  | tee -a log-install.txt
echo "   - Websocket SSH(HTTP)     : 80, 8880"  | tee -a log-install.txt
echo "   - Websocket SSL(HTTPS)    : 443"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "    [INFORMASI Grpc, Bdvp, Ngnx]" | tee -a log-install.txt
echo "    ---------------------------" | tee -a log-install.txt
echo "   - Badvpn                  : 7200"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo "   - Grpc                    : 443"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "    [INFORMASI XRAY]"  | tee -a log-install.txt
echo "    ----------------" | tee -a log-install.txt
echo "   - Xray Vmess Ws Tls       : 443"  | tee -a log-install.txt
echo "   - Xray Vless Ws Tls       : 443"  | tee -a log-install.txt
echo "   - Xray Trojan Ws Tls      : 443"  | tee -a log-install.txt
echo "   - Xray Vmess Ws None Tls  : 80, 8080"  | tee -a log-install.txt
echo "   - Xray Vless Ws None Tls  : 80, 8080"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo -e "\e[1;32m══════════════════ Autoscript By Rerechan02 ══════════════════\e[0m" | tee -a log-install.txt
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
