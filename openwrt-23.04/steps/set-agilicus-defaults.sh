#!/bin/bash
ROOTDIR=$(pwd)
echo $ROOTDIR
if [ ! -e "$ROOTDIR/build" ]; then
    echo "Please run from root / no build dir"
    exit 1
fi

cd "$ROOTDIR/build"

cd openwrt/files
cat << "EOF" > etc/uci-defaults/99-agilicus-setup
# uci set dhcp.wan.ignore=1
uci set dhcp.lan.ignore='1'
uci set system.@system[0].hostname='agilicus-nanopi-r5'
uci commit
EOF

