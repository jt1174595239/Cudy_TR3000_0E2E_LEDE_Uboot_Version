#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.199.1/g' package/base-files/luci2/bin/config_generate

# Modify hostname
sed -i 's/LEDE/TR3000/g' package/base-files/luci2/bin/config_generate

# Modify timezone
sed -i 's/UTC/CST-8/g' package/base-files/luci2/bin/config_generate

# Modify default WiFi region
sed -i 's/US/AU/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Delete default WiFi ssid & encryption
sed -i '/ssid=LEDE/{N;N;d}' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Customize Wifi settings
sed -i '/network=lan/a\
set wireless.@wifi-device[0].channel=1\
set wireless.@wifi-iface[0].ssid=Cudy-0E2E\
set wireless.@wifi-iface[0].encryption=psk2+aes\
set wireless.@wifi-iface[0].key=New@2018\
set wireless.@wifi-device[1].channel=40\
set wireless.@wifi-iface[1].ssid=Cudy-0E2E-5G\
set wireless.@wifi-iface[1].encryption=psk2+aes\
set wireless.@wifi-iface[1].key=New@2018' package/kernel/mac80211/files/lib/wifi/mac80211.sh
