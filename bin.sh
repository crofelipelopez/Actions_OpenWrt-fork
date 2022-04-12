#!/bin/bash
# 修改默认IP
sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate
# 修改默认主题
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
#修改主机名
#sed -i 's/OpenWrt/AutoBuild/g' package/base-files/files/bin/config_generate
#关闭自建私有源签名验证
#sed -i '92d' package/system/opkg/Makefile


#添加额外软件包
#git clone https://github.com/lisaac/luci-app-dockerman.git package/openwrt-packages/luci-app-dockerman
#git clone  https://github.com/fw876/helloworld package/openwrt-packages/luci-app-helloworld
#git clone https://github.com/xiaorouji/openwrt-passwall.git package/openwrt-packages/luci-app-passwall
svn co https://github.com/naoki66/luci-app-passwall  feeds/luci-app-passwall
#git clone https://github.com/xiaorouji/openwrt-passwall2.git package/openwrt-packages/luci-app-passwall2
#git clone https://github.com/NagaseKouichi/openwrt-chinadns-ng.git package/chinadns-ng
#git clone -b luci https://github.com/NagaseKouichi/openwrt-chinadns-ng.git package/luci-app-chinadns-ng
git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/applications/luci-app-smartdns
#svn co https://github.com/siropboy/mypackages/trunk/luci-app-autopoweroff package/openwrt-packages/luci-app-autopoweroff
#git clone https://github.com/tty228/luci-app-serverchan.git package/openwrt-packages/luci-app-serverchan
#git clone https://github.com/zzsj0928/luci-app-pushbot package/openwrt-packages/luci-app-pushbot
#git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/openwrt-packages/luci-app-jd-dailybonus
#git clone https://github.com/binge8/luci-theme-argon-mc.git package/openwrt-packages/luci-theme-argon-mc
#git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/openwrt-packages/luci-theme-opentomcat
#git clone https://github.com/binge8/luci-theme-butongwifi.git package/openwrt-packages/luci-theme-butongwifi
#git clone https://github.com/openwrt-develop/luci-theme-atmaterial.git package/openwrt-packages/luci-theme-atmaterial
#git clone https://github.com/binge8/luci-app-koolproxyR.git package/openwrt-packages/luci-app-koolproxyR
#git clone https://github.com/binge8/luci-app-koolddns.git package/openwrt-packages/luci-app-koolddns
#git clone https://github.com/tuanqing/install-program package/openwrt-packages/install-program
#svn co https://github.com/0saga0/OpenClash/trunk/luci-app-openclash package/openwrt-packages/luci-app-openclash
#svn co https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom/trunk/luci-theme-infinityfreedom package/openwrt-packages/luci-theme-infinityfreedom

#添加qemu-ga代理下pve执行“shutdown”，代替openwrt的关机指令”poweroff“。
#mkdir -p ~/openwrt/files/sbin
#touch ~/openwrt/files/sbin/shutdown
#echo -e '#!/bin/sh\nbusybox poweroff' > ~/openwrt/files/sbin/shutdown
#chmod 0755 ~/openwrt/files/sbin/shutdown

#添加包含 passwall 的 feed 
echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall" >> feeds.conf.default
echo "src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2" >> feeds.conf.default

#添加包含 helloword 的 feed 
echo "src-git helloworld https://github.com/fw876/helloworld.git" >> feeds.conf.default


#更新和安装库 
./scripts/feeds update -a
./scripts/feeds install -a

#升级smartdns版本
#sed -i 's/1.2021.35/2022.04.04/g' feeds/packages/net/smartdns/Makefile
#sed -i 's/f50e4dd0813da9300580f7188e44ed72a27ae79c/24661c2419a81e660b11a0e3d35a3bc269cd4bfa/g' feeds/packages/net/smartdns/Makefile
#sed -i 's/^PKG_MIRROR_HASH/#&/' feeds/packages/net/smartdns/Makefile

#升级zerotier版本
#sed -i 's/=1.8.4/=1.8.7/g' feeds/packages/net/zerotier/Makefile
#sed -i 's/^PKG_HASH/#&/' feeds/packages/net/zerotier/Makefile
