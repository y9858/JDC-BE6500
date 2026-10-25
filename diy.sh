#!/bin/bash

# 修改默认主题
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/applications/luci-app-argon-config
git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci-light/Makefile

# 修改默认 IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# ttyd 免帐号登录
sed -i 's/\/bin\/login/\/bin\/login -f root/' feeds/packages/utils/ttyd/files/ttyd.config

# bash 替换 ash
sed -i '1s/ash/bash/' package/base-files/files/etc/passwd

# 修改 luci-app-cpufreq
sed -i 's/CPU 性能优化调节/CPU 性能调节/g' feeds/luci/applications/luci-app-cpufreq/po/zh_Hans/cpufreq.po

# 生成编译时间
date "+%Y-%m-%d %H:%M:%S %z" >> package/base-files/files/etc/build_date

# 添加非官方软件包
git clone --depth 1 https://github.com/y9858/luci-app-lucky package/luci-app-lucky
git clone --depth 1 https://github.com/sbwml/luci-app-openlist2 package/luci-app-openlist2
git clone --depth 1 https://github.com/nikkinikki-org/OpenWrt-nikki package/OpenWrt-nikki
git clone --depth 1 https://github.com/y9858/luci-app-clientstatus package/luci-app-clientstatus
rm -rf feeds/packages/net/speedtest-cli
git clone --depth 1 https://github.com/y9858/luci-app-netspeedtest package/luci-app-netspeedtest

# 修改首页显示
rm -rf feeds/packages/lang/golang
git clone --depth 1 https://github.com/sbwml/packages_lang_golang feeds/packages/lang/golang

rm -rf feeds/packages/lang/rust
git clone --depth 1 https://github.com/sbwml/packages_lang_rust feeds/packages/lang/rust
