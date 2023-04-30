[homeicon]:https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/home-en.png
[rtlogicon]:https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/rt-log.png
[fxminerproxyv3.zip]:https://github.com/FxPool/FXMinerProxy/releases/download/10.3.1/fxminerproxyv3windows.zip
[简体中文]:https://github.com/FxPool/FXMinerProxy/blob/main/readmes/zh.md
[randlogin]:https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/randlogin_en.png
<p align="center"><a  target="_blank" rel="noopener noreferrer"><img width="300" src="https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/logo.png" alt="Vue logo"></a></p>
<p align="center">
  <a>
    <img src="https://img.shields.io/badge/Release-10.3.1-orgin.svg" alt="travis">
  </a>
  <a>
    <img src="https://img.shields.io/badge/Last_Update-2023 05 01-orgin.svg" alt="travis">
  </a>
  <a>
    <img src="https://img.shields.io/badge/Language-GoLang-green.svg" alt="travis">
  </a>
  <a>
    <img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="travis">
  </a>
</p>
<p align="center">
  <a href="https://github.com/FxPool/FXMinerProxy/blob/main/readmes/zh.md" target="_blank">简体中文</a> •
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


# FXMinerProxy
Custom charging proxy software for mining pool. Coin support `BTC`, `LTC`, `ZEC`, `ETC`, `ETHF`, `ETHW`, `RVN`, `CFX`, `BEAM`, `ERGO`, `BTG`, `AE`, `FLUX`, `FIRO`, `NEOXA`,`XMR`, `KASPA`, `GRIN`, `KDA`, `DASH`, `CKB`, `RXD`,`ZIL`,`ETHW_ZIL`,`ETHF_ZIL`,`ETC_ZIL`,`KDA`, `DASH`, `CKB` , `ZEN` , `NEXA`, `HNS`, `BCH`, `IRON`    

## Toll collection system model
<p><a target="_blank" rel="noopener noreferrer"><img width="1200" height="240" src="https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/TollSys.png"></a></p>

## Dashboard
![homeicon]
![rtlogicon]

## language
  * Us English
  * [简体中文]

## Disclaimer
    1.The app design and maintenance personnel only provide technical services without any profit purpose, and the operation of this app complies with the laws and regulations where the server is located.
    Users of this app must use this software in strict accordance with local laws and regulations, and shall bear corresponding legal responsibilities if they use this app to violate local laws.
    2.Before using this app, please read the description of this app in detail. If the user does not have any losses caused by the technical problems of this app, the user shall be responsible for it, and the app development and maintenance personnel shall be responsible for the loss. Regardless, the user shall not claim or file a lawsuit against the developer or maintainer for this.
    3.You should make sure you are not a resident of mainland China, Cuba, Iran, North Korea, Syria, Russia or other countries or regions subject to sanctions managed or enforced by relevant countries or governments or international agencies. The legal responsibility arising from the app shall be borne by myself.
    4.fxminerproxy are the only 1 officially software name.

## Contact Us
- Email: hansenloveyou520@gmail.com
- [Telegram老群(建议大家都加新群老群将慢慢转移过来)](https://t.me/FxminerChat)
- [Telegram新群](https://t.me/fxminerproxy_chat_cn)

## Deploy

- `The system uses random web port and user name and password, please pay attention to the console print when booting`
- ![randlogin]
  
- Recommended configuration`(Theoretical memory per worker:100K~150K)`
  | workers |     CPU |     Mem | bandwidth    |
  | ------- | ------- | ------- |  -------     |
  | n<200       | 1 core |     1Gb | 2Mbps     |
  |200<n<500    | 1 core |     2Gb | 4Mbps     |
  |500<n<1000   | 2 core |     2Gb | 10Mbps    |
  |1000<n<5000  | 2 core |     4Gb | 50Mbps    |
  |5000<n<10000 | 4 core |     6Gb | 300Mbps   |
  |n>10000      | 8 core |     16Gb| 500Mbps   |


#### Linux
- **permissions** `root`
- **system required** `centOS 7+ / debian 8+ / ubuntu 16+`
- **recommend** `debian`
- **curl** tool is required **debian ubuntu download:** `apt-get install curl`
- **wget** tool is required **debian ubuntu download:** `apt-get install wget`

- install new versions
  
  ```shell
  bash <(curl -s -L https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/install_en.sh)
  ```
- install older versions

  ```shell
  bash <(curl -s -L https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/oldversion/install_en.sh) verNumber
  ```

- Stable version

  ```shell
  bash <(curl -s -L https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/oldversion/install_en.sh) 10.2.1
  ```

#### windows
- **permissions** `administrator`
- **system required** `windows8+`
- **recommend** `WindowsServer2012`
- **how to run**

  * 1 Decompress fxminerproxyv3.zip
  * 2 open fxminerproxyv3 dir and run `run.exe`

- **download**

  | version | name                |
  | ------- | -------             |
  | latest   | [fxminerproxyv3.zip]|
  
- Download older versions from [github releases](https://github.com/FxPool/FXMinerProxy/releases)

## Features
* Support Windows & Linux.
* Log.
  * Worker RT-Log.`(Simulation mining core, real-time display mining machine mining logs)`
  * Worker History-Log. `(hash logs, network logs, charge logs)`
  * Sys History-Log
* Wallet.`(Supports access to third-party apis. Display historical hash rate, etc)`
  * Support F2pool
  * Support PoolIn
  * Support ViaBtc
  * Support AntPool
  * Support Ethermine
* Chart
  * Single mining machine historical hash curve.
  * Shares Chart. `(fee shares, total worker shares, total miner shaers)`
  * Latency Chart.
  * Hash Chart.
* Event notification.`(All core events)`
* High concurrency and low memory.`(2 core 4g:1400worker:CPU:2%,MEM:10%)`.
* Dynamic parameters of a port are modified.
* Single worker machine charge ratio adjustment.
* Support Asic machine between the different mining pool to charge.
* Support fast ping vaul.e`(fast response: ping:current server to mining machine)`
* Support User-defined ssl certificate.
* Support Import port configurations in batches through the configuration file.
* The asic machine calculates the hash power in real time to solve the problem that the computation hash power cannot be displayed at the acic machine.
* Support for obfuscated encrypted connections.
* Support SSL connection to mining pools.
* Dev Fee: 
  * all coin 0.27%
  * personal 0%
  * activation:
    * **require:** worker > `200`
    * worker 200-1000: 0.24%
    * worker 1000-5000: 0.2%
    * worker 5000-10000: 0.15%
    * worker > 10000: 0.1%

## Watchdog
Prevent a program from crashing while running. Use a watchdog program to keep it running steadily throughout the day
* linux use script: **running.sh**
* windows use: **run.exe**

## Explanatory Document
[User guide](https://fxpool.github.io/cn/)

## API Documentation
[API Reference](https://fxpool.github.io/cn/)

## Stable charge curve
- **BTC F2POOL Fee example**
<p><a target="_blank" rel="noopener noreferrer"><img width="1200" height="300" src="https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/stable-chart.png"></a></p>


## Changelog
Detailed changes for each release are documented in the [release notes](https://github.com/FxPool/FXMinerProxy/releases).
