#!/bin/bash
pkill -9 YouMiIpServer
cd /tmp
rm -f youmi.tar.gz
wget -c https://raw.githubusercontent.com/xiaofengQ/ProxyServer/main/youmi.tar.gz
tar zxvf youmi.tar.gz
rm -rf /root/youmi
mv youmi /root/
cd /root/youmi/
chmod 777 YouMiIpServer
nohup ./YouMiIpServer > YoumiIp.log 2>&1 &
sleep 1

chmod 777 /etc/rc.local

c=`cat /etc/rc.local | grep youmi | wc -l`
if [ $c == 0 ]; then
	echo "# you mi" >> /etc/rc.local
	echo "cd /root/youmi" >> /etc/rc.local
	echo "nohup ./YouMiIpServer > YoumiIp.log 2>&1 &" >> /etc/rc.local
fi

echo "安装完成"
