[homeicon]:https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/home-en.png
[rtlogicon]:https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/rt-log.png
[fxminerproxyv3.zip]:https://github.com/FxPool/FXMinerProxy/releases/download/v15.2.8@251026/fxminerproxyv3windows.zip
[简体中文]:https://github.com/FxPool/FXMinerProxy/blob/main/readmes/zh.md
[English]:https://github.com/FxPool/FXMinerProxy/blob/main/readmes/English.md
[randlogin]:https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/randlogin.png
[bigminerexample]:https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/zh-example.png
[app-x]:https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/app-x.png
[d1]:https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/d1.png
[d2]:https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/d2.png
[international]:https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/international.png
[qq_group]:https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/QQfx2025.png
<p align="center"><a  target="_blank" rel="noopener noreferrer"><img width="500" src="https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/logo.svg" alt="Vue logo"></a></p>
<p align="center">
  <a>
    <img src="https://img.shields.io/badge/Release-v15.2.8@251026-orgin.svg" alt="travis">
  </a>
  <a>
    <img src="https://img.shields.io/badge/Last_Update-2025 10 26-orgin.svg" alt="travis">
  </a>
  <a>
    <img src="https://img.shields.io/badge/Language-GoLang-green.svg" alt="travis">
  </a>
  <a>
    <img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="travis">
  </a>
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

## 支持语言
  * [English]
  * [简体中文]

# FXMinerProxy(原创正版)
虚拟货币矿池中转抽水收费代理软件支持币种: `BTC`, `LTC`, `ZEC`, `ETC`, `ETHF`, `ETHW`, `RVN`, `CFX`, `BEAM`, `ERGO`, `BTG`, `AE`, `FLUX`, `FIRO`, `NEOXA`,`XMR`, `KASPA`, `GRIN`, `KDA`, `DASH`, `CKB`, `RXD`,`ZIL`,`ETHW_ZIL`,`ETHF_ZIL`,`ETC_ZIL`,`KDA`, `DASH`, `CKB` , `ZEN` , `NEXA`, `HNS`, `BCH`, `IRON`等等 币种一直在更新中可能这里没有展示完全请安装软件查看

## 免责声明
    1.本客户端设计、维护人员仅提供技术服务，不以营利为目的，本客户端的运行遵守服务器所在地的法律法规。本客户端用户必须严格按照当地法律法规使用本软件，如使用本客户端违反当地法律，应承担相应的法律责任。
    2.在使用本应用程序之前，请详细阅读本应用程序的描述。如果用户没有因本应用程序的技术问题造成任何损失，由用户自行负责，损失由应用程序开发和维护人员负责。无论如何，用户不得就此向开发者或维护者提出索赔或诉讼。
    3.您应确保您不是中国大陆、古巴、伊朗、朝鲜、叙利亚、俄罗斯或其他受相关国家或政府或国际机构管理或执行的制裁的国家或地区的居民。由此产生的法律责任由本人承担。
    4.Fxminerproxy是唯一一个正式的软件名称。    
## 部署
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
  ```shell
  bash <(curl -s -L https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/install_zh.sh)
  ```
- 安装指定版本
  ```shell
  bash <(curl -s -L https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/oldversion/install_zh.sh) 版本号
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
  | 老板本 | [github releases](https://github.com/FxPool/FXMinerProxy/releases) |
  
## 后台面板
![homeicon]
![rtlogicon]

## 6000+的BTC大矿场长时间稳定运行
![bigminerexample]

## 稳定的抽水算力曲线
- **鱼池 BTC 例子**
<p><a target="_blank" rel="noopener noreferrer"><img width="1200" height="300" src="https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/stable-chart.png"></a></p>

## 历史版本
[release notes](https://github.com/FxPool/FXMinerProxy/releases).

## 联系我们
- 邮件: hansenloveyou520@gmail.com
- [飞机群](https://t.me/fxminerproxy_chat_cn)
- 企鹅
<p><a  target="_blank" rel="noopener noreferrer"><img width="390" src="https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/QQfx2025.png" alt="Vue logo"></a></p>

