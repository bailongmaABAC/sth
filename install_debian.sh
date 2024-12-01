#!/data/data/com.termux/files/usr/bin/bash
echo "建议授予内部存储访问权限"
termux-setup-storage

pkg install wget proot proot-distro -y
sed -i 's/github.com/ghp.ci\/github.com/' $PREFIX/etc/proot-distro/debian.sh
proot-distro install debian

echo "#!/data/data/com.termux/files/usr/bin/bash
proot-distro login debian --shared-tmp
" > $HOME/debian.sh
chmod +x $HOME/debian.sh
echo "Debian已安装完成，正在进入系统"

$HOME/debian.sh
