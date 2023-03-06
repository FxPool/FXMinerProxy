[homeicon]:https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/home-en.png
[rtlogicon]:https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/rt-log.png
[fxminerproxyv3.zip]:https://github.com/FxPool/FXMinerProxy/releases/download/10.0.3/fxminerproxyv3windows.zip
[简体中文]:https://github.com/FxPool/FXMinerProxy/blob/main/readmes/zh.md
[randlogin]:https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/randlogin.png
<p align="center"><a  target="_blank" rel="noopener noreferrer"><img width="300" src="https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/logo.png" alt="Vue logo"></a></p>
<p align="center">
  <a>
    <img src="https://img.shields.io/badge/Release-10.0.3-orgin.svg" alt="travis">
  </a>
  <a>
    <img src="https://img.shields.io/badge/Last_Update-2023 03 07-orgin.svg" alt="travis">
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
  <a href="https://www.youtube.com/watch?v=fAce-zatHqA" target="_blank">油管演示视频</a> •
</p>

# FXMinerProxy
虚拟货币矿池中转抽水收费代理软件支持币种: `BTC`, `LTC`, `ZEC`, `ETC`, `ETHF`, `ETHW`, `RVN`, `CFX`, `BEAM`, `ERGO`, `BTG`, `AE`, `FLUX`, `FIRO`, `NEOXA`, `XMR`, `KASPA`, `GRIN`, `KDA`, `DASH`, `CKB`

## 收费系统模型
<p><a target="_blank" rel="noopener noreferrer"><img width="1200" height="240" src="https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/TollSys.png"></a></p>

## 后台面板
![homeicon]
![rtlogicon]

## 支持语言
  * Us English
  * [简体中文]

## 免责声明
    1.本客户端设计、维护人员仅提供技术服务，不以营利为目的，本客户端的运行遵守服务器所在地的法律法规。本客户端用户必须严格按照当地法律法规使用本软件，如使用本客户端违反当地法律，应承担相应的法律责任。
    2.在使用本应用程序之前，请详细阅读本应用程序的描述。如果用户没有因本应用程序的技术问题造成任何损失，由用户自行负责，损失由应用程序开发和维护人员负责。无论如何，用户不得就此向开发者或维护者提出索赔或诉讼。
    3.您应确保您不是中国大陆、古巴、伊朗、朝鲜、叙利亚、俄罗斯或其他受相关国家或政府或国际机构管理或执行的制裁的国家或地区的居民。由此产生的法律责任由本人承担。
    4.Fxminerproxy是唯一一个正式的软件名称。

## 联系我们
- 邮件: hansenloveyou520@gmail.com
- [飞机群](https://t.me/FxminerChat)

## 手机APP
- 安卓已经上线 苹果正在提交审核中...(如二维码失效可到电报群下载)
<p align="center">
<img width="200" src="https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/app_android_download.png" alt="Vue logo">
<img width="400" src="https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/phone1.jpg" alt="Vue logo">
</p>

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
- 安装新版本一键安装脚本
  
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
[User guide](https://www.fxpool.org)

## API 开发文档
[API Reference](https://www.fxpool.org)

## 稳定的抽水算力曲线
- **鱼池 BTC 例子**
<p><a target="_blank" rel="noopener noreferrer"><img width="1200" height="300" src="https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/stable-chart.png"></a></p>


## ⚠️ 常见问题

* 软件安装失败原因
  * 如果出现permission denied 说明当前你不是root权限需要进去root权限 debian，unbantu，执行 su 命令  输入密码即可

* 软件安装成功浏览器打不开
  * 这种问题一般是端口没有开放，如果你购买的云服务器比如阿里等需要首先到云服务器后台开放端口安全组，使用什么端口就开放什么端口，也可以全部开放范围0-65535.然后如果还是连接不上，且系统是linux的话还需要开放服务器的端口。服务器可以直接关闭防火墙。使用 ufw disable(debian和unbantu系统)。

* 抽水转换率问题
  * 由于抽水转换率根据份额和难度动态计算，可能开机时会很大不用担心，时间一长会接近你设置的值，可能也会小于你设置的值，但总体来说会接近你设置的值，实际情况还是看你抽水矿池的算力
芯片机抽水转换率统计会比显卡慢一些通常要运行24小时后会接近你设置的值。时间还是以矿池为准

* 芯片机算力的问题
  * 由于芯片机器不提交算力，fxminerproxy是根据难度动态计算，10分钟计算一次所以芯片机要等10分钟后才能显示，算力只做参考具体以矿池为准
* 本地矿机已经连接上了但是后台不显示
  * fxminerproxy需要矿机成功提交一次有效的份额才会显示，请等待矿机提交有效的份额
* 芯片机器问题
  * 程序的端口会自动判断是显卡机器还是芯片机器所以无效单独配置
A11矿机抽水最好是抽到相同的矿池，不同的矿池可能会出现无效，主要还是要看固件是否支持set_exnaoce方法(动态修改随机数)，保守做法抽到同一个矿池
奶牛、茉莉、亚米等矿机可抽任意矿池
**自己定义目标矿池的问题
  * fxminerProxy支持自定义端口，有小伙伴经常问到为什么只能下拉选择不能自己输入，其实输入和下拉是做到一起的，鼠标选中后直接输入回车确定即可
* 首页不显示数据但端口界面可以显示数据的问题
  * 先别急，运行10分钟后看，这个问题出现的概率很小，除非服务器获取的时间出现问题，常见使用了国际服务器，一般做法重启一下软件(设置界面)。重启后如果有些数据还是没有显示，那么不用担心先不用管，运行超过>=8小时（有可能是24小时）后会自动恢复正常，因为中国时间和国际时间的差值影响的、
* 不开抽水功能是否真的作者不抽水
  * 这个问题其实容易测试，可以用纯转发的软件测试对比算力。纯转发软件可以用这个 <a href="https://github.com/snail007/goproxy">纯转发(开源)</a>

## 历史版本
[release notes](https://github.com/FxPool/FXMinerProxy/releases).
