## OpenWrt 23.05 (beta)

### General Info
- Based of openwrt 23.05.0-rc2

### Configuration
- OpenWRT 23.05 Vanilla / Kernel 5.15
- ImmortalWRT patches for Rockchip target NanoPi R5S (rk3568)
- NanoPi R5S : r8125 Realtek driver
- Console access on HDMI + USB keyboard

### Applications
- A useful set of applications from official OpenWrt package feed
- Mini build without UI
- Full build with LuCI, docker and extra packages
- firewall4 based (nftables) + iptables compatibility packages for now, might change later.
- pbr latest version from https://github.com/stangri/source.openwrt.melmac.net

### Changelog
- [2023-06-28] Freeze to 23.05.0-rc2 / Update packages
- [2023-06-21] Update patches
- [2023-04-25] Update patches and enable hdmi console
- [2023-04-16] Re-add some disabled features and packages
- [2023-04-10] Initial build
