#!/bin/bash
cp /etc/apt/sources.list /etc/apt/sources.list.bak
sed -i 's/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list

apt update && apt install wget openssh-server screen -y
sed -i 's/#Port 22/Port 2233/' /etc/ssh/sshd_config
/usr/sbin/sshd

wget https://ghp.ci/github.com/fatedier/frp/releases/download/v0.61.0/frp_0.61.0_linux_arm64.tar.gz
tar -zxvf frp_0.61.0_linux_arm64.tar.gz
rm frp_0.61.0_linux_arm64.tar.gz

cd frp_0.61.0_linux_arm64
mv frpc.toml frpc.toml.bak
echo "[common]
server_addr = free.frpee.com
server_port = 7000
user = 11526
meta_password = 11328
[ssh]
type = tcp
local_ip = 127.0.0.1
local_port = 2233
remote_port = 11362
" > frpc.ini
screen -dmS frpc "cd $HOME/frp_0.61.0_linux_arm64 && ./frpc"
echo "配置完成"
