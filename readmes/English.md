[homeicon]: https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/home-en.png
[rtlogicon]: https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/rt-log.png
[fxminerproxyv3.zip]: https://github.com/FxPool/FXMinerProxy/releases/download/v15.2.9@251030/fxminerproxyv3windows.zip
[Simplified Chinese]: https://github.com/FxPool/FXMinerProxy/blob/main/readmes/zh.md
[English]: https://github.com/FxPool/FXMinerProxy/blob/main/readmes/English.md
[中文]: https://github.com/FxPool/FXMinerProxy/blob/main/README.md
[randlogin]: https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/randlogin.png
[bigminerexample]: https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/zh-example-01.png
[app-x]: https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/app-x.png
[d1]: https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/d1.png
[d2]: https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/d2.png
[international]: https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/international.png
[qq_group]: https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/QQfx2025.png
<p align="center"><a target="_blank" rel="noopener noreferrer"><img width="500" src="https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/logo.svg" alt="Vue logo"></a></p> <p align="center"> <a> <img src="https://img.shields.io/badge/Release-v15.2.9@251030-orgin.svg" alt="travis"> </a> <a> <img src="https://img.shields.io/badge/Last_Update-2025 10 30-orgin.svg" alt="travis"> </a> <a> <img src="https://img.shields.io/badge/Language-GoLang-green.svg" alt="travis"> </a> <a> <img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="travis"> </a> </p> <p align="center"> <a href="https://fxpool.github.io/cn/" target="_blank">Tutorial-Chinese</a> • </p> <p align="center"> <a href="https://www.youtube.com/watch?v=fAce-zatHqA" target="_blank">YouTube Demo Video</a> • </p> <p align="center"> <a href="https://www.youtube.com/watch?v=A0oGFG7CRIM&t=110s" target="_blank">Tunnel Encryption Video Tutorial</a> • </p>

## Supported Languages
  * [English]
  * [中文]

## FXMinerProxy (Original & Official)
Cryptocurrency mining pool proxy software with fee deduction support. Supported coins:  `BTC`, `LTC`, `ZEC`, `ETC`, `ETHF`, `ETHW`, `RVN`, `CFX`, `BEAM`, `ERGO`, `BTG`, `AE`, `FLUX`, `FIRO`, `NEOXA`,`XMR`, `KASPA`, `GRIN`, `KDA`, `DASH`, `CKB`, `RXD`,`ZIL`,`ETHW_ZIL`,`ETHF_ZIL`,`ETC_ZIL`,`KDA`, `DASH`, `CKB` , `ZEN` , `NEXA`, `HNS`, `BCH`, `IRON` etc. Coins are constantly being updated; this list may not be complete. Please install the software to check.


## Disclaimer
  ```text
1. The designers and maintainers of this client only provide technical services, not for profit purposes. The operation of this client complies with the laws and regulations of the location where the server is based. Users of this client must strictly use this software in accordance with local laws and regulations. If the use of this client violates local laws, the user shall bear the corresponding legal responsibilities.
2. Before using this application, please read the description of this application in detail. If the user does not suffer any losses due to technical problems of this application, the user shall be responsible for the losses, and the losses shall be the responsibility of the application developer and maintainer. In any case, the user shall not make claims or lawsuits against the developer or maintainer for this reason.
3. You should ensure that you are not a resident of Mainland China, Cuba, Iran, North Korea, Syria, Russia, or other countries or regions subject to sanctions administered or enforced by relevant countries, governments, or international institutions. The resulting legal responsibilities shall be borne by yourself.
4. Fxminerproxy is the only official software name.
  ```
    
## Deployment
- Recommended Configuration`(Theoretical Memory per Miner: 100K~150K)`
  | Miners Count |     CPU |     RAM | Bandwidth    |
  | ------- | ------- | ------- |  -------     |
  | n<200       | 1 core |     1Gb | 2Mbps     |
  |200<n<500    | 1 core |     2Gb | 4Mbps     |
  |500<n<1000   | 2 core |     2Gb | 10Mbps    |
  |1000<n<5000  | 2 core |     4Gb | 50Mbps    |
  |5000<n<10000 | 4 core |     6Gb | 300Mbps   |
  |n>10000      | 8 core |     16Gb| 500Mbps   |
#### Linux System
- **Permission** `root`
- **Supported Systems ** `centOS 7+ / debian 8+ / ubuntu 16+`
- **Recommended System** `debian`
- **Requires curl tool debian ubuntu install:** `apt-get install curl`
- **Requires wget tool debian ubuntu install:** `apt-get install wget`
- Latest Version
  ```shell
  bash <(curl -s -L https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/install.sh)
  ```
- Install Specific Version
  ```shell
  bash <(curl -s -L https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/install.sh) 版本号
  ```
#### Windows System
- **Permission** `administrator`
- **System Support ** `windows8+`
- **Recommended System** `WindowsServer2012`
- **How to Run**

  * 1 Unzip fxminerproxyv3.zip
  * 2 Open the fxminerproxyv3 folder and run `run.exe` Only running run.exe can ensure the program does not crash.

- **Download**

  | Version | Name                |
  | ------- | -------             |
  | Latest   | [fxminerproxyv3.zip]|
  | Old Versions | [github releases](https://github.com/FxPool/FXMinerProxy/releases) |
  
## Admin Panel
![homeicon]
![rtlogicon]

## Large BTC Mining Farm with 6000+ Miners Running Stably for a Long Time
![bigminerexample]

## Stable Fee Hashrate Curve
- **F2Pool BTC Example**
<p><a target="_blank" rel="noopener noreferrer"><img width="1200" height="300" src="https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/stable-chart.png"></a></p>

## Version History
[release notes](https://github.com/FxPool/FXMinerProxy/releases).

## Contact Us
- Email: hansenloveyou520@gmail.com
- [Telegram Group](https://t.me/fxminerproxy_chat_cn)
- QQ  <a target="_blank" href="https://qm.qq.com/cgi-bin/qm/qr?k=rxUt_mukm5EdrE5SGY7pnyU4VNnKSx3V&jump_from=webapi&authKey=h+p674FGJ9WiG3XO1Elhu+vOIzn+fP9r+pHcJcQmyVbyy/PBM8oXvLAyj3j07e6r"><img border="0" src="//pub.idqqimg.com/wpa/images/group.png" alt="fxminerproxy2025" title="fxminerproxy2025"></a>
<p><a  target="_blank" rel="noopener noreferrer"><img width="390" src="https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/QQfx2025.png" alt="Vue logo"></a></p>

