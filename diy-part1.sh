#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
sed -i '$a src-git jerryk https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default

cat << EOF | tee -a configs/OrangePi_R1_Plus_LTS_defconfig configs/OrangePi_R1_Plus_defconfig 
CONFIG_PACKAGE_luci-app-openclash=y
CONFIG_PACKAGE_luci-app-passwall=y
CONFIG_PACKAGE_luci-app-ssr-plus=y
CONFIG_PACKAGE_luci-app-aliyundrive-webdav=y
CONFIG_PACKAGE_luci-app-unblockneteasemusic=y
CONFIG_PACKAGE_luci-app-adguardhome=y
EOF
