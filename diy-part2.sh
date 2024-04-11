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

git clone --depth=1 -b main https://github.com/fw876/helloworld.git
cp -rf helloworld/chinadns-ng package/chinadns-ng
cp -rf helloworld/dns2socks package/dns2socks
cp -rf helloworld/dns2tcp package/dns2tcp
cp -rf helloworld/gn package/gn
cp -rf helloworld/hysteria package/hysteria
cp -rf helloworld/ipt2socks package/ipt2socks
cp -rf helloworld/lua-neturl package/lua-neturl
cp -rf helloworld/luci-app-ssr-plus package/luci-app-ssr-plus
cp -rf helloworld/microsocks package/microsocks
cp -rf helloworld/mosdns package/mosdns
cp -rf helloworld/naiveproxy package/naiveproxy
cp -rf helloworld/redsocks2 package/redsocks2
cp -rf helloworld/shadow-tls package/shadow-tls
cp -rf helloworld/shadowsocks-rust package/shadowsocks-rust
cp -rf helloworld/shadowsocksr-libev package/shadowsocksr-libev
cp -rf helloworld/simple-obfs package/simple-obfs
cp -rf helloworld/tcping package/tcping
cp -rf helloworld/trojan package/trojan
cp -rf helloworld/tuic-client package/tuic-client
cp -rf helloworld/v2ray-core package/v2ray-core
cp -rf helloworld/v2ray-plugin package/v2ray-plugin
cp -rf helloworld/v2raya package/v2raya
cp -rf helloworld/xray-core package/xray-core
cp -rf helloworld/xray-plugin package/xray-plugin

git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall-packages.git
cp -rf openwrt-passwall-packages/chinadns-ng package/chinadns-ng
cp -rf openwrt-passwall-packages/tcping package/tcping
cp -rf openwrt-passwall-packages/trojan-go package/trojan-go
cp -rf openwrt-passwall-packages/trojan-plus package/trojan-plus
cp -rf openwrt-passwall-packages/ssocks package/ssocks
cp -rf openwrt-passwall-packages/hysteria package/hysteria
cp -rf openwrt-passwall-packages/dns2tcp package/dns2tcp
cp -rf openwrt-passwall-packages/sing-box package/sing-box

git clone --depth=1 https://github.com/kongfl888/luci-app-adguardhome.git package/luci-app-adguardhome

git clone --depth=1 https://github.com/kenzok8/small-package.git kenzok8-packages
cp -rf kenzok8-packages/ddnsto package/ddnsto
cp -rf kenzok8-packages/luci-app-ddnsto package/luci-app-ddnsto

git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon

./scripts/feeds update -a
./scripts/feeds install -a -f
