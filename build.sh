#!/bin/bash
set -e
P=./openwrt-23.04/steps
$P/01_clone_openwrt.sh
$P/02_prepare_openwrt_folder.sh
$P/03_patch_openwrt.sh
$P/04-prepare_package.sh
$P/05-create_luci_acl.sh
$P/06-create_config_from_seed.sh
$P/07-all_kmods.sh
# $P/create_acl_for_luci.sh
# $P/organize_files.sh
