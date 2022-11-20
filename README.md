# Openwrt自用版云编译项目

## 固件来源：

P3TERX云编译脚本地址：[https://github.com/P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)

padavanonly固件源码地址：[padavanonly/immortalwrtARM (github.com)](https://github.com/padavanonly/immortalwrtARM/tree/mt7986)

由衷感谢所有为openwrt无私奉献的大佬们。

## 固件说明：

AX6000闭源WiFi驱动版

### 红米AX6000有两种版本，每个版本包含

* 只启用IPv4
* 同时启用IPv4和IPv6

两种版本软件包相同，由于是硬路由，所以软件包会多一些，后面还有打算集成ddnsgo相关的东西

### **AX6000登录信息**

| 配置项 |     值     |
| :----: | :--------: |
|   IP   | 172.16.3.2 |
| 用户名 |    root    |
|  密码  |     空     |
|  2.4G  |  Openwrt  |
|   5G   | Openwrt5G |

## 软件清单

* helloworld
* mosdns
* vlmcsd
* wireguard
* ddns-go

## 固件下载

**点击[Actions](https://github.com/JAM2199562/myopdiy/actions) 或者[Releases](https://github.com/JAM2199562/myopdiy/releases) 选择需要的版本**
