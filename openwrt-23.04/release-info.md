## OpenWrt 23.04 (beta)

### General Info
- Based of openwrt 23.04 branch

### Configuration
- OpenWRT 23.04 Vanilla / Kernel 5.15
- ImmortalWRT patches for Rockchip target NanoPi R5S (rk3568)
- NanoPi R4S : r8168 driver for R4S (realtek) instead of kernel r8169 + r8169 firmwares package

### Applications
- A useful set of applications from official OpenWrt package feed
- Mini build without UI
- Full build with LuCI, docker and extra packages
- firewall4 based (nftables) + iptables compatibility packages for now, might change later.
- pbr latest version from https://github.com/stangri/source.openwrt.melmac.net

### Changelog
- [2023-04-10] Initial build
