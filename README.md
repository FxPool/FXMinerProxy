[homeicon]:https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/home-en.png
[rtlogicon]:https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/rt-log.png
[fxminerproxyv3.zip]:https://github.com/FxPool/FXMinerProxy/releases/download/13.4.0/fxminerproxyv3windows.zip
[简体中文]:https://github.com/FxPool/FXMinerProxy/blob/main/readmes/zh.md
[English]:https://github.com/FxPool/FXMinerProxy/blob/main/readmes/English.md
[randlogin]:https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/randlogin.png
[bigminerexample]:https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/zh-example.png
[app-x]:https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/app-x.png
[d1]:https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/d1.png
[d2]:https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/d2.png
[international]:https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/international.png
<p align="center"><a  target="_blank" rel="noopener noreferrer"><img width="500" src="https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/logo.png" alt="Vue logo"></a></p>
<p align="center">
  <a>
    <img src="https://img.shields.io/badge/Release-13.4.0-orgin.svg" alt="travis">
  </a>
  <a>
    <img src="https://img.shields.io/badge/Last_Update-2025 04 26-orgin.svg" alt="travis">
  </a>
  <a>
    <img src="https://img.shields.io/badge/Language-GoLang-green.svg" alt="travis">
  </a>
  <a>
    <img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="travis">
  </a>
</p>
<p align="center">
  6000台BTC矿机大矿场已长时间稳定运行超几个月以上
</p>
<p align="center">
  <a href="https://fxpool.github.io/cn/" target="_blank">使用教程-中文</a> •
</p>
<p align="center">
  <a href="https://www.youtube.com/watch?v=fAce-zatHqA" target="_blank">油管演示视频</a> •
</p>
<p align="center">
  <a href="https://www.youtube.com/watch?v=A0oGFG7CRIM&t=110s" target="_blank">隧道加密视频教程</a> •
</p>

# FXMinerProxy(原创正版)
虚拟货币矿池中转抽水收费代理软件支持币种: `BTC`, `LTC`, `ZEC`, `ETC`, `ETHF`, `ETHW`, `RVN`, `CFX`, `BEAM`, `ERGO`, `BTG`, `AE`, `FLUX`, `FIRO`, `NEOXA`,`XMR`, `KASPA`, `GRIN`, `KDA`, `DASH`, `CKB`, `RXD`,`ZIL`,`ETHW_ZIL`,`ETHF_ZIL`,`ETC_ZIL`,`KDA`, `DASH`, `CKB` , `ZEN` , `NEXA`, `HNS`, `BCH`, `IRON`等等 币种一直在更新中可能这里没有展示完全请安装软件查看

## 联系我们
- 邮件: hansenloveyou520@gmail.com
- [飞机新群](https://t.me/fxminerproxy_chat_cn)
- 没有飞机群的一定要下载安装注册一个飞机群,可以先通过邮件联系,qq联系方式已经下线了

## 免责声明
    1.本客户端设计、维护人员仅提供技术服务，不以营利为目的，本客户端的运行遵守服务器所在地的法律法规。本客户端用户必须严格按照当地法律法规使用本软件，如使用本客户端违反当地法律，应承担相应的法律责任。
    2.在使用本应用程序之前，请详细阅读本应用程序的描述。如果用户没有因本应用程序的技术问题造成任何损失，由用户自行负责，损失由应用程序开发和维护人员负责。无论如何，用户不得就此向开发者或维护者提出索赔或诉讼。
    3.您应确保您不是中国大陆、古巴、伊朗、朝鲜、叙利亚、俄罗斯或其他受相关国家或政府或国际机构管理或执行的制裁的国家或地区的居民。由此产生的法律责任由本人承担。
    4.Fxminerproxy是唯一一个正式的软件名称。

## 收费系统模型
<p><a target="_blank" rel="noopener noreferrer"><img width="1200" height="240" src="https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/TollSys.png"></a></p>

## 后台面板
![homeicon]
![rtlogicon]

## 支持语言
  * [English]
  * [简体中文]
    
## 手机APP
国际地址
https://dnf8qp5ds93ne.cloudfront.net/2bxzkd

![international]

## 部署

- `系统采用随机端口用户名和密码，启动的时候请注意控制台的打印`

  ![randlogin]

- 推荐配置`(理论单台矿机内存:100K~150K)`
  | 矿机数 |     CPU |     内存 | 带宽    |
  | ------- | ------- | ------- |  -------     |
  | n<200       | 1 core |     1Gb | 2Mbps     |
  |200<n<500    | 1 core |     2Gb | 4Mbps     |
  |500<n<1000   | 2 core |     2Gb | 10Mbps    |
  |1000<n<5000  | 2 core |     4Gb | 50Mbps    |
  |5000<n<10000 | 4 core |     6Gb | 300Mbps   |
  |n>10000      | 8 core |     16Gb| 500Mbps   |


#### Linux 系统
- **权限** `root`
- **支持的系统** `centOS 7+ / debian 8+ / ubuntu 16+`
- **推荐系统** `debian`
- **需要curl** 工具 **debian ubuntu 下载:** `apt-get install curl`
- **需要wget** 工具 **debian ubuntu 下载:** `apt-get install wget`
- 最新的版本
  * 外网
  ```shell
  bash <(curl -s -L https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/install_zh.sh)
  ```
- 安装指定版本
  * 外网
  ```shell
  bash <(curl -s -L https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/oldversion/install_zh.sh) 版本号
  ```
- 稳定的版本
  * 外网
  ```shell
  bash <(curl -s -L https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/oldversion/install_zh.sh) 13.0.4
  ```
#### windows系统
- **权限** `administrator`
- **系统支持** `windows8+`
- **推荐系统** `WindowsServer2012`
- **如何运行**

  * 1 解压 fxminerproxyv3.zip
  * 2 打开 fxminerproxyv3 文件夹然后运行 `run.exe` 只能运行run.exe可保证程序不死机

- **下载**

  | 版本 | 名称                |
  | ------- | -------             |
  | 最新   | [fxminerproxyv3.zip]|
  
- 下载老版本 [github releases](https://github.com/FxPool/FXMinerProxy/releases)

## 特色
* 支持 Windows & Linux.
* 日志系统.
  * 矿机实时日志.`(模拟矿工内核显示的日志可以分析矿机有效无效份额提交延迟信息等)`
  * 矿机历史日志. `(算力日志, 上线离线日志, 抽水日志等)`
  * 系统日志
* 钱包.`(支持接入第三方API显示历史算力曲线和收益数据等)`
  * 支持 鱼池
  * 支持 币印
  * 支持 微比特
  * 支持 蚂蚁池
  * 支持 E池
* 曲线
  * 单个矿机的历史算力曲线统计
  * 份额曲线. `(抽水份额 矿机总份额 矿工份额 1小时份额 24小时份额)`
  * 延迟历史曲线.
  * 总算力曲线.
* 事件通知.`(如矿机离线和一些核心操作的事件通知(可以通过邮件或者server酱))`
* 超高并发超低内存.
* 端口参数热更新(不用重启).
* 支持单台矿机抽水比例修改(只支持在线矿机).
* 支持芯片机器的跨矿池抽水.
* 支持快速响应`(矿机本地显示的延迟是当前服务器到矿机的延迟而不是矿池到矿机的延迟)`
* 支持自定义ssl/tls证书上传.
* 支持代理端口数据通过配置文件导入快速配置.
* 支持动态计算芯片机器和一些不上报本地算力机器的算力(10分中计算一次会有误差只做参考).
* 支持隧道加密技术。[sslmix隧道加密](https://github.com/FxPool/SSLMIX)。[aesmix隧道加密](https://github.com/FxPool/AESMIX)
* 支持服务器到矿池使用ssl连接.
* 开发费用: 
  * 所有币种 0.27%
  * 个人 0%
  * 激活后:(默认)
    * **前提:** 矿机数量 > `200`
    * 矿机数 200-1000: 0.24%
    * 矿机数 1000-5000: 0.2%
    * 矿机数 5000-10000: 0.15%
    * 矿机数 > 10000: 0.1%

## 看门狗程序
保证程序出现意外死机后立即重启程序
* linux使用这个脚本(一键启动脚本已经自动加载手动安装的用户请使用这个脚本启动程序): **running.sh**
* windows使用: **run.exe**

## 使用说明书
[User guide](https://fxpool.github.io/cn/)

## API 开发文档
[API Reference](https://fxpool.github.io/cn/)

## 5000+的BTC大矿场长时间稳定运行
![bigminerexample]

## 稳定的抽水算力曲线
- **鱼池 BTC 例子**
<p><a target="_blank" rel="noopener noreferrer"><img width="1200" height="300" src="https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/stable-chart.png"></a></p>

## 历史版本
[release notes](https://github.com/FxPool/FXMinerProxy/releases).

