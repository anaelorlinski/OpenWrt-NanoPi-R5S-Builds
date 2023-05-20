#!/bin/bash
ROOTDIR=$(pwd)
if [ ! -e "$ROOTDIR/build" ]; then
    echo "Please run from root / no build dir"
    exit 1
fi

cd "$ROOTDIR/build"
mkdir -p openwrt/files

cd openwrt/files
mkdir -p etc/uci-defaults
mkdir -p www/luci-static/openwrt2020
echo "Create default config in $(pwd)/etc/uci-defaults/99-agilicus-setup"
cat << "EOF" > etc/uci-defaults/99-agilicus-setup
# uci set dhcp.wan.ignore=1
uci set dhcp.lan.ignore='1'
uci set system.@system[0].hostname='agilicus-nanopi-r5'
uci set dockerd.globals.data_root='/var/docker/'
echo -e "n\np\n3\n4210690\n\nw\n" | fdisk /dev/mmcblk1
mkfs.ext4 -L var /dev/mmcblk1p3
echo /dev/mmcblk1p3 /var ext4 errors=remount-ro 0 1 >> /etc/fstab
eval $(blkid -o export /dev/mmcblk1p3)
uci add fstab mount
uci set fstab.@mount[3].enabled='1'
uci set fstab.@mount[3].uuid=$UUID
uci set fstab.@mount[3].target='/var'
uci commit
sed -i -e 's?00A3E1?0057b8?g' -e 's?002B49?bbbbbb?g' /www/luci-static/openwrt2020/cascade.css
echo agilicus:x:1000: >> /etc/group

echo iptables -A INPUT -m owner --gid 1000 -j ACCEPT > /etc/rc.local
echo iptables -A OUTPUT -m owner --gid 1000 -j ACCEPT >> /etc/rc.local

sed -i -e 's?/bin/ash?/bin/bash?' /etc/passwd

if [ -f /etc/init.d/agilicus-agent ]
then
    sed -i -e '/procd_set_param group/d' -e 's?procd_close_instance?procd_set_param group agilicus\n        procd_close_instance?' /etc/init.d/agilicus-agent
fi
echo ""
echo "-----------------------------------------"
echo "  DONE INITIAL SETUP. REBOOT.            "
echo "-----------------------------------------"
echo ""
reboot

EOF
chmod a+rx etc/uci-defaults/99-agilicus-setup

cp $ROOTDIR/openwrt-23.04/logo.svg www/luci-static/openwrt2020/
