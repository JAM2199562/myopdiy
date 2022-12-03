# Openwrt自用版云编译项目

## 固件来源：

P3TERX云编译脚本地址：[https://github.com/P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)

ImmortalWrt固件源码地址：[https://github.com/immortalwrt/immortalwrt](https://github.com/immortalwrt/immortalwrt)

x-wrt固件源码地址：[https://github.com/x-wrt/x-wrt](https://github.com/x-wrt/x-wrt)

闭源固件源码地址：

1. [padavanonly/immortalwrtARM](https://github.com/padavanonly/immortalwrtARM/tree/mt7986)
2. [hanwckf/immortalwrt-mt798x ](https://github.com/hanwckf/immortalwrt-mt798x)

由衷感谢所有为openwrt无私奉献的大佬们。

## 固件说明：

X86版采用ImmortalWrt源码版本，极度精简，这个是拿来配合ROS做策略路由的，软件包会比较简单，主要的包有

- 那啥的
- 解析DNS的，用的是mosdns，这个是个人最中意的方案
- 去广告的，暂定adbyby-plus，这个是受邀加入

红米AX6000采用多种源代码编译，详细看各个分支的README吧

## 固件下载

**点击[Actions](https://github.com/JAM2199562/myopdiy/actions) 或者[Releases](https://github.com/JAM2199562/myopdiy/releases) 选择需要的版本**
