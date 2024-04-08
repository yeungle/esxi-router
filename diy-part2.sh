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
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

rm -rf feeds/luci/themes/luci-theme-argon

git clone https://github.com/fw876/helloworld.git package/helloworld

git clone https://github.com/kongfl888/luci-app-adguardhome.git package/luci-app-adguardhome

git clone https://github.com/kenzok8/small-package.git package/kenzok8-packages

git clone https://github.com/jerrykuku/luci-theme-argon.git -b 18.06 package/luci-theme-argon

./scripts/feeds update -a
./scripts/feeds install -a -f
