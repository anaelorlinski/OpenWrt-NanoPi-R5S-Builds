#!/bin/bash
ROOTDIR=$(pwd)
echo $ROOTDIR
if [ ! -e "$ROOTDIR/build" ]; then
    echo "Please run from root / no build dir"
    exit 1
fi

cd "$ROOTDIR/build"

cd openwrt
# copy R4S in any case, and then patch if R2S
cp $ROOTDIR/openwrt-23.04/seed/agilicus-R5S-full.seed .config

make defconfig
