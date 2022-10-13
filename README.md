# Openwrt自用版云编译项目

## 固件来源：

P3TERX云编译脚本地址：[https://github.com/P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)

ImmortalWrt固件源码地址：[https://github.com/immortalwrt/immortalwrt](https://github.com/immortalwrt/immortalwrt)

x-wrt固件源码地址：[https://github.com/x-wrt/x-wrt](https://github.com/x-wrt/x-wrt)

lede固件源码地址：[https://github.com/coolsnowwolf/lede)

由衷感谢所有为openwrt无私奉献的大佬们。

## 固件说明：
主要编译两种设备的固件：X86版和红米AX6000

### X86版采用ImmortalWrt源码版本，极度精简，共包含两种版本

* 只启用IPv4
* 同时启用IPv4和IPv6

两种版本软件包相同，这个主要自用来配合RouterOS做策略路由，使用到的功能主要有mosdns和helloworld

### 红米AX6000采用coolsnowwolf和x-wrt生成两种版本，每个版本包含

* 只启用IPv4
* 同时启用IPv4和IPv6

两种版本软件包相同，由于是硬路由，所以软件包会多一些，后面还有打算集成ddnsgo相关的东西


### **X86版登录信息**

| 配置项 |     值     |
| :----: | :--------: |
|   IP   | 172.16.3.2 |
| 用户名 |    root    |
|  密码  |  password  |



### **x-wrt版AX6000登录信息(暂时)**

| 配置项 |      值      |
| :----: | :----------: |
|   IP   | 192.168.15.1 |
| 用户名 |    admin     |
|  密码  |      空      |
|  2.4G  |   Openwrt    |
|   5G   |  Openwrt5G   |

### **coolsnowwolf版AX6000登录信息(规划中)**

| 配置项 |      值      |
| :----: | :----------: |
|   IP   | 192.168.1.1 |
| 用户名 |    admin     |
|  密码  |      空      |
|  2.4G  |   Openwrt    |
|   5G   |  Openwrt5G   |


## 软件清单

* helloworld
* mosdns
* vlmcsd
* wireguard



## 固件下载

**点击[Actions](https://github.com/JAM2199562/myopdiy/actions) 或者[Releases](https://github.com/JAM2199562/myopdiy/releases) 选择需要的版本**
