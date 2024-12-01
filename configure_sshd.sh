#!/data/data/com.termux/files/usr/bin/bash
pkg install wget -y
wget ghp.ci/https://github.com/fatedier/frp/releases/download/v0.61.0/frp_0.61.0_android_arm64.tar.gz
tar -zxvf frp_0.61.0_android_arm64.tar.gz
cd frp_0.61.0_android_arm64
mv frpc.toml frpc.toml.bak
echo "[common]
server_addr = free.frpee.com
server_port = 7000

user = 11526
meta_password = 11328

[ssh]
type = tcp
local_ip = 127.0.0.1
local_port = 8022
remote_port = 11362
" > frpc.ini
sshd && ./frpc
