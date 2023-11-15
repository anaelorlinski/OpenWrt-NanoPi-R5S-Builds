#!/bin/bash
ROOTDIR=$(pwd)
echo $ROOTDIR
if [ ! -e "$ROOTDIR/build" ]; then
    echo "Please run from root / no build dir"
    exit 1
fi

cd "$ROOTDIR/build"

cp -R openwrt-fresh-23.05 openwrt

<<<<<<< HEAD
# freeze revision to 23.05.0
cd openwrt
git reset --hard bd4f415efacfc03bbe5b79ae1d39c1451f5f7385
=======
# freeze revision to 23.05.2
cd openwrt
git reset --hard 1c26bcb10819f072964a658e2cc29bb87613a6f5
>>>>>>> 108fda3 (openwrt 23.05.2)

echo "Current OpenWRT commit"
git log -1
git describe

# install feeds
# cd openwrt
# ./scripts/feeds update -a && ./scripts/feeds install -a

