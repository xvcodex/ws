#!/bin/bash
clear
IP=$(wget -qO- icanhazip.com);
date=$(date +"%Y-%m-%d")
clear
echo " VPS Data Backup"
sleep 1
echo " Directory Created"
mkdir /root/backup
sleep 1
echo " VPS Data Backup Start Now . . ."
clear
echo " Please Wait , Backup In Process Now . . ."
sleep 1
clear
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp -r /etc/wireguard backup/wireguard
cp /etc/shadowsocks-libev/akun.conf backup/ss.conf
cp -r /var/lib/premium-script/ backup/premium-script
cp -r /usr/local/etc/xray backup/xray
cp -r /etc/trojan-go backup/trojan-go
cp -r /usr/local/shadowsocksr/ backup/shadowsocksr
cp -r /home/vps/public_html backup/public_html
cd /root
zip -r $IP-$date.zip backup > /dev/null 2>&1
rclone copy /root/$IP-$date.zip dr:backup/
url=$(rclone link dr:backup/$IP-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"
echo "VPS Data Backup By DIYVPN"
echo "Telegram : https://t.me/NORULEZZx /@NORULEZZx"
echo ""
echo -e "Please Copy Link Below & Save In Notepad

Your VPS IP ( $IP )

$link

If you want to restore data, please enter the link above

Thank You For Using Our Services"
rm -rf /root/backup
rm -r /root/$IP-$date.zip
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
