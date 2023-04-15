# static ip
-disable 'lan' bridge #option type 'bridge'
-add gw / dns
option gateway '192.168.1.1'
        option dns '192.168.1.1'
# disable wan / wan6

/etc/config/dhcp
'lan'
option ignore '1'



# shairport
1.
 # Use OpenWrt UCI config
config shairport-sync 'shairport_sync'
        option enabled '1'
        option name 'Shairport-Sync'
        option interpolation 'soxr' # basic/soxr