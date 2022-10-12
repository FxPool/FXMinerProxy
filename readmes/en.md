
<p align="center"><a href="https://vuejs.org" target="_blank" rel="noopener noreferrer"><img width="400" src="https://raw.githubusercontent.com/FxPool/FxMinerProxyV3/main/image/logo.png" alt="Vue logo"></a></p>

## Contact us

 <a href="https://t.me/FxMinerProxyV3_en_chat" target="_blank">Telegram</a> 

  <a href="" target="_blank">Email：hansenloveyou520@gmail.com</a> 


## 🛰️ Recommendation system
<p align="center">
<img width="200" src="https://raw.githubusercontent.com/FxPool/FxMinerProxyV3/main/image/debianlog.jpeg" alt="Vue logo">
<img src="https://img.shields.io/badge/Version-8.7-orgin.svg" alt="travis">
<img src="https://img.shields.io/badge/Version-8.9-orgin.svg" alt="travis">
<img src="https://img.shields.io/badge/Version-8.11-orgin.svg" alt="travis">
</p>

## ⏬ APP Download (Currently, only Chinese is supported)
### Android is available and Apple is submitting it for review...
<p align="center">
<img width="200" src="https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/app_android_download.png" alt="Vue logo">
<img width="400" src="https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/image/phone1.jpg" alt="Vue logo">
</p>

## 🗼 abstract

Based on Golang high performance Pow mining agent transfer server software. FXMinerProxy Updated version, Chinese name Fourier. New UI interface, background SSH console, mobile APP, program does not restart, 2 core 2G server (not lightweight) easy 3000 sets without pressure

## 💰 To support the currency

ETH/ETC/BTC/LTC/RVN/CFX/TON/BEAM/ERG/BTG/FLUX/AE/NEOAX/ETHW/ETF/FIRO (If you need to add new currency, please contact us. If it is a chip machine and we don't have it, you can connect to our server and add it in a day. We will bear the loss of this day.)

## 🌐 WEB home page

![](https://raw.githubusercontent.com/FxPool/FxMinerProxyV3/main/image/home_en.png)
  
## 🖥️ SSH server Teamwork control background

![](https://raw.githubusercontent.com/FxPool/FxMinerProxyV3/main/image/ssh_en.jpg)
  
  
## ✨: features

* ☁️: support ETC, ETH, BTC, LTC, RVN, BEAM, ERG, CFX much money fee, such as built-in exclusive development a key encryption to confuse the client configuration automatically generated executable program Windows and OS support, open API, exclusive of any currency pair support

* ⚡: High performance million concurrent CPU usage is very low, 300,000 connected CPU usage is 10%

* 📚 Original fee algorithm for E pool optimization E pool feeeffect is the best, no mining machine offline bug curve is perfect, several points higher than other software

* 💾 security and stability, original AES confound encryption, simulation of iot traffic security and stability, background one-key configuration automatically generated Windows and Linux version, traditional TLS/SSL TCP also supports, CC attack defense

* ⚙️: pre-proxy mode, internal configuration to improve access speed, delay fast response support, so that the user's display delay is the delay of your current proxy server

* 📤: Chip miner calculates power in real time, solving the problem that chip level cannot display 

* 🗃️: indicates hot configuration modification. After rejecting the traditional configuration, you need to restart the configuration file and modify the configuration file. One-click configuration file import and export is supported

* 🎨: exquisite UI, support history record curve management detailed to a single mining machine support

* ⚙️: Real-time system error log display, let you know any time the server is working status

* 👪: Multi-system support, Windows, Linux one-click installation run

* 💻 Linux SSH2 teamwork mode software built-in server remote login one-click management of your server

## 🛠️: Server Deployment

### Linux one-click Management scripts (root permission required)

#### mining machine if more than 100, it is strongly recommended to use debian8 system, such as debian8.9, debian8.11, as long as the large version is 8 character version can be arbitrary

* If you do not have the curl command, enter apt-get install curl
```shell
  bash <(curl -s -L https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/install_en.sh)
```
* Download the specified version
```shell
   bash <(curl -s -L https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/oldversion/install_en.sh) Version number (e.g. 8.0.2.1)
```
### Windows direct download unzip run run.exe
* Run run.exe (to ensure the program never crashes)
```shell
  https://raw.githubusercontent.com/FxPool/FxMinerProxyV3/main/fxminerproxyv3windows.zip
```  
## ⚗️: Develop fee

* Start fee fixed 0.27%

* If fee mode is not opened for personal use, the developer is 0. If you do not believe, you can use pure fee software for comparison, or software packet capture test

* Big hash rate users please contact us to activate the software to enjoy lower developer fee

## ⚠️ Frequently Asked Questions

### Cause of the software installation failure

If permission denied appears, it indicates that you are not root. You need to access debian, unbantu and run su to enter the password

### The browser cannot be opened

This problem is generally that the port is not open, if you buy a cloud server such as Ali, you need to first go to the cloud server background to open the port security group, use what port to open what port, can also be all open range 0-65535. Then, if you still can't connect, and the system is Linux, you need to open the port of the server. The server can disable the firewall directly. Use the UFW Disable (Debian and UnBantu systems).

### fee conversion rate

Because the fee conversion rate is calculated dynamically according to the share and difficulty, it may be very large when starting, do not worry about it, a long time will be close to the value you set, may also be less than the value you set, but generally speaking, it will be close to the value you set, the actual situation depends on the calculation force of your fee mining pool
The fee conversion rate of the chip machine will be a little slower than that of the graphics card and will usually be close to the value you set after 24 hours of operation. The time is based on the mine pool

### The problem of chip computing power

Since the chip machine does not submit the calculation power, FXMinerproxy is based on the difficulty of dynamic calculation, 10 minutes, so the chip machine will wait 10 minutes before the display, the calculation power only for reference specific to the mine pool

### Local miner is connected but not shown in the background

Fxminerproxy will display only when the miner successfully submits a valid share, please wait for the miner to submit a valid share

### ASIC machine problem

The port of the program will automatically determine whether it is a graphics card machine or a chip machine, so it is invalid to configure separately

A11 mining machine fee is best to fee to the same mining pool, different mining pools may be invalid, mainly depends on whether the firmware supports SET_exNAoce method (dynamic modification of random number), conservative fee to the same mining pool

### The problem of defining your own target pool

FxminerProxy support custom port, a small partner often asked why can only select the drop-down can not input their own, in fact, the input and drop-down is done together, after the mouse is selected directly enter to determine

### The home page does not display data but the port interface can display data problem

Don't worry, after running for 10 minutes, the probability of this problem is very small, unless there is a problem with the time obtained by the server, usually using international servers, the general practice is to restart the software (Settings interface). If some data is still not displayed after restart, don't worry about it. After running for more than >=8 hours (possibly 24 hours), it will automatically return to normal, because the difference between Chinese time and international time will affect,

### Does not turn on the fee function is it true that the author does not fee

This problem is actually easy to test, you can use pure forwarding software test comparative computing power. Pure forwarding software can use the <a href = "https://github.com/snail007/goproxy" > pure forwarding (open source) </a>
