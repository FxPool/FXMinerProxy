<p align="center"><a  target="_blank" rel="noopener noreferrer"><img width="300" src="https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/logo.png" alt="Vue logo"></a></p>
<p align="center">
  <a>
    <img src="https://img.shields.io/badge/Release-8.3.2-orgin.svg" alt="travis">
  </a>
  <a>
    <img src="https://img.shields.io/badge/Last_Update-2022_11_18-orgin.svg" alt="travis">
  </a>
  <a>
    <img src="https://img.shields.io/badge/Language-GoLang-green.svg" alt="travis">
  </a>
  <a>
    <img src="https://img.shields.io/badge/License-Apache-green.svg" alt="travis">
  </a>
</p>
<p align="center">
  <a href="https://github.com/FxPool/FXMinerProxy/blob/main/readmes/zh.md" target="_blank">简体中文</a> •
</p>
<p align="center">
<a href="https://console-docs.apipost.cn/preview/280432b691e741ca/411c6c29b9f5d365" target="_blank">Tutorial</a> •
</p>

# FXMinerProxy
![](https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/home-en.png")
Custom charging proxy software for mining pool. Coin support `BTC`, `LTC`, `ZEC`, `ETC`, `ETHF`, `ETHW`, `RVN`, `CFX`, `BEAM`, `ERGO`, `BTG`, `AE`, `FLUX`, `FIRO`, `NEOXA`, `XMR`, `KASPA`, `GRIN`

## Disclaimer
    1.The app design and maintenance personnel only provide technical services without any profit purpose, and the operation of this app complies with the laws and regulations where the server is located.
    Users of this app must use this software in strict accordance with local laws and regulations, and shall bear corresponding legal responsibilities if they use this app to violate local laws.
    2.Before using this app, please read the description of this app in detail. If the user does not have any losses caused by the technical problems of this app, the user shall be responsible for it, and the app development and maintenance personnel shall be responsible for the loss. Regardless, the user shall not claim or file a lawsuit against the developer or maintainer for this.
    3.You should make sure you are not a resident of mainland China, Cuba, Iran, North Korea, Syria, Russia or other countries or regions subject to sanctions managed or enforced by relevant countries or governments or international agencies. The legal responsibility arising from the app shall be borne by myself.
    4.fxminerproxyv3 are the only 1 officially software name.

## Contact Us
- Email: hansenloveyou520@gmail.com
- [Telegram](https://t.me/FxminerChat)

## Deploy
#### Linux
- **permissions** `root`
- **system required** `centOS 7+ / debian 8+ / ubuntu 16+`
- **recommend** `debian8.7...debian8.11`
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

#### windows
- **permissions** `administrator`
- **system required** `windows8+`
- **recommend** `WindowsServer2012`
- **how to run**

  * 1 Decompress fxminerproxy.zip
  * 2 make sure run `run.exe`

- **download**

  | version | name |
  | ------- | ------- |
  | 8.3.2 | [fxminerproxyv3.zip](https://github.com/FxPool/FXMinerProxy/releases/download/8.3.2/fxminerproxyv3windows.zip) |
  | 8.3.1.1 | [fxminerproxyv3.zip](https://github.com/FxPool/FXMinerProxy/releases/download/8.3.1.1/fxminerproxyv3windows.zip) |
  | 8.3.1 | [fxminerproxyv3.zip](https://github.com/FxPool/FXMinerProxy/releases/download/8.3.1/fxminerproxyv3windows.zip) |
  | 8.3.0 | [fxminerproxyv3.zip](https://github.com/FxPool/FXMinerProxy/releases/download/8.3.0/fxminerproxyv3windows.zip) |
  | 8.2.2.4 | [fxminerproxyv3.zip](https://github.com/FxPool/FXMinerProxy/releases/download/8.2.2.4/fxminerproxyv3windows.zip) |
  
- Download older versions from [github releases](https://github.com/FxPool/FXMinerProxy/releases)

## Features
* Support Windows & Linux.
* High concurrency and low memory.`(2 core 4g:1400worker:CPU:2%,MEM:10%)`.
* Dynamic parameters of a port are modified.
* Single worker machine charge ratio adjustment.
* Support Asic machine between the different mining pool to charge.
* Support fast ping vaul.e`(fast response: ping:current server to mining machine)`
* Support Real-time system error log display.
* Support User-defined ssl certificate.
* Support Import port configurations in batches through the configuration file.
* Support historical record curve statistics management, detailed to a single mining machine
* The asic machine calculates the hash power in real time to solve the problem that the computation hash power cannot be displayed at the acic machine.
* Support for obfuscated encrypted connections.
* Support SSL connection to mining pools.
* Dev Fee: 
  * all coin 0.27%
  * personal 0%
  * activation:
    * **require:** worker > `200`
    * worker 200-1000 0.24%
    * worker 1000-10000 0.2%
    * worker > 10000 0.15%

## CMD options：
**fxminerproxyv3 -cmd**
  * -apikey `Contact the developer to get information if you need to add your own fee wallet`
  * -language `en or zh`

## JSON config file
* `localconfig.json`
``` json
{
    "user_name": "admin",
    "password": "admin",
    "web_theme": "8",
    "web_port": 62438,// default browser port
    "is_agree_articles": true,
    "statistical_refresh_time": 30,
    "is_open_log": true,
    "is_open_visit_mode": false,
    "is_open_general_swap": false,// is true: you port will support any socket packet
    "is_default_ssl_cert": true,
    "cert_file_name": "",// user define ssl path
    "cert_file_key_name": "",// user define ssl path
    "coin_type": "",// current coin type ,"" is all
    "language": "en",
    "confuse": {// new version is not support
        "ip": "127.0.0.1",
        "api_port": 80,
        "code": 0
    },
    "visit_web": {
        "web_port": 18111,
        "user_name": "visit",
        "password": "88888888"
    },
    "enc_config_info": null,
    "coins": [
    ]
}
```
* `localcoinconfig.json`
```json
{
    "user_pool_cfg": [
        {
            "coin_type": "ETF",
            "close_reason": "",
            "is_open": true,
            "is_pay": true,
            "fee_algorithm": 1,//must 1
            "transit": {
                "is_run": true,
                "listen_port": 14383,
                "target_address": "etc.f2pool.com:6688",
                "nick_name": "test9768"
            },
            "connect_method": "stratum+ssl",
            "local_hash_rate_percentage": 100,//fake hash rate
            "is_fast_response": false,
            "is_front_proxy": false,
            "pay": [
                {
                    "pay_pool": "etc.f2pool.com:6688",
                    "pay_wallet": "test_wallet",
                    "pay_password": "x",
                    "pay_name": "test",
                    "proportion": 7.1
                }
            ],
            "filter_wallet": [
                "test_wallet"
            ],
            "advanced_settings": {
                "blacklist_wallet": [
                    "test_wallet01"
                ],
                "blacklist_wallet_replace": "test_wallet01",
                "is_open_pool_mode": true,
                "unify_miner_name": "test_wallet01",
                "unify_worker_name": "test_worker"
            }
        }
    ],
    "target_pool_info": [
        {
            "coin_type": "ETF",
            "address": "etc.f2pool.com:6688",
            "note_zh": "",
            "note_en": "test"
        }
    ]
}
```
## Watchdog
Prevent a program from crashing while running. Use a watchdog program to keep it running steadily throughout the day
* linux use script: **running.sh**
* windows use: **run.exe**



## API Documentation
[API Reference](https://www.fxpool.org)

## User-guided Documentation
- **coin manage**

- **add proxy coin port**

- **add target mining pool**

## Coin fee curve display
- **BTC**
<p><a target="_blank" rel="noopener noreferrer"><img width="600" height="50" src="https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/btc-en.png" alt="Vue logo"></a></p>

- **LTC**
<p><a target="_blank" rel="noopener noreferrer"><img width="600" height="50" src="https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/ltc-en.png" alt="Vue logo"></a></p>

- **ZEC**
<p><a target="_blank" rel="noopener noreferrer"><img width="600" height="50" src="https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/zec-en.png" alt="Vue logo"></a></p>

- **ETHF**
<p><a target="_blank" rel="noopener noreferrer"><img width="600" height="50" src="https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/ethf-en.png" alt="Vue logo"></a></p>

- **ETHW**
<p><a target="_blank" rel="noopener noreferrer"><img width="600" height="50" src="https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/ethw-en.png" alt="Vue logo"></a></p>



## Changelog
Detailed changes for each release are documented in the [release notes](https://github.com/FxPool/FXMinerProxy/releases).
