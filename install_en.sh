#!/bin/bash

router_line=$1

version='v15.2.8@251026'

convert_version() {
    local version="$1"
    
    # Remove leading 'v'
    version="${version#v}"
    
    # Replace '@' with '-'
    version="${version//@/-}"
    
    echo "$version"
}

path_version=$(convert_version "$version")

shell_version='6.0.8'
uiname='FXMinerProxyV3-shell'
pkgname='FXMinerProxy'
authorname='FxPool'
installname='install.sh'
webuiname='ui'
sofname='fxminerproxyv3'
wdog='runningFXMPV3'
installfolder='/etc/fxpool-fxminerproxyv3/runningFXMPV3'
installdir='/etc/fxpool-fxminerproxyv3/'
myFile=$version.tar.gz

red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'
clearscr='\033c'

str2='backline'
if [[ $str2 == $router_line ]]
then
    echo "Special Line"
   download_url=https://raw.githubusercontent.com/FxPool/fxminerbin/main/$version.tar.gz
else
   download_url=https://github.com/$authorname/$pkgname/archive/refs/tags/$version.tar.gz
   router_line='Default'
fi

# Check if current download file exists
if [ ! -f "$myFile" ]; then
    echo "\n"
else
    rm $version.tar.gz
fi

# Stop old version
PROCESS=$(ps -ef | grep porttran | grep -v grep | grep -v PPID | awk '{ print $2}')
for i in $PROCESS; do
    echo "Kill the $1 process [ $i ]"
    kill -9 $i
done
PROCESS=$(ps -ef | grep ppexec | grep -v grep | grep -v PPID | awk '{ print $2}')
for i in $PROCESS; do
    echo "Kill the $1 process [ $i ]"
    kill -9 $i
done

OsSupport()
{
    if grep -Eqii "CentOS" /etc/issue || grep -Eq "CentOS" /etc/*-release; then
        DISTRO='CentOS'
        PM='yum'
    elif grep -Eqi "Red Hat Enterprise Linux Server" /etc/issue || grep -Eq "Red Hat Enterprise Linux Server" /etc/*-release; then
        DISTRO='RHEL'
        PM='yum'
    elif grep -Eqi "Aliyun" /etc/issue || grep -Eq "Aliyun" /etc/*-release; then
        DISTRO='Aliyun'
        PM='yum'
    elif grep -Eqi "Fedora" /etc/issue || grep -Eq "Fedora" /etc/*-release; then
        DISTRO='Fedora'
        PM='yum'
    elif grep -Eqi "Debian" /etc/issue || grep -Eq "Debian" /etc/*-release; then
        DISTRO='Debian'
        PM='apt'
    elif grep -Eqi "Ubuntu" /etc/issue || grep -Eq "Ubuntu" /etc/*-release; then
        DISTRO='Ubuntu'
        PM='apt'
    elif grep -Eqi "Raspbian" /etc/issue || grep -Eq "Raspbian" /etc/*-release; then
        DISTRO='Raspbian'
        PM='apt'
    else
        DISTRO='unknow'
    fi
    echo $DISTRO;
    str1="CentOS,Ubuntu,Debian"
    if [[ $str1 =~ $DISTRO ]]
    then
       # echo support this os system 
       return
    else
       # echo not support this os system pls use CentOS,Ubuntu,Debian
       echo && echo -n -e "${yellow}Unsupported OS detected. Recommended: CentOS, Ubuntu, or Debian. Press Enter to continue installation, CTRL+C to exit: ${plain}" && read temp
    fi
}

change_limit() {
    changeLimit="n"
    if [ $(grep -c "root soft nofile" /etc/security/limits.conf) -eq '0' ]; then
        echo "root soft nofile 65535" >>/etc/security/limits.conf
        echo "* soft nofile 65535" >>/etc/security/limits.conf
        changeLimit="y"
    fi

    if [ $(grep -c "root hard nofile" /etc/security/limits.conf) -eq '0' ]; then
        echo "root hard nofile 65535" >>/etc/security/limits.conf
        echo "* hard nofile 65535" >>/etc/security/limits.conf
        changeLimit="y"
    fi
    if [ $(grep -c "DefaultLimitNOFILE=65535" /etc/systemd/user.conf) -eq '0' ]; then
        echo "DefaultLimitNOFILE=65535" >>/etc/systemd/user.conf
        changeLimit="y"
    fi

    if [ $(grep -c "DefaultLimitNOFILE=65535" /etc/systemd/system.conf) -eq '0' ]; then
        echo "DefaultLimitNOFILE=65535" >>/etc/systemd/system.conf
        changeLimit="y"
    fi

    if [[ "$changeLimit" = "y" ]]; then
        echo "Connection limit changed to 65535, effective after server reboot"
    else
        echo -n "Current connection limit: "
        ulimit -n
    fi
    before_show_menu
}

check_limit() {
    echo "Current system connection limit:"
    ulimit -n
    before_show_menu
}

checkProcess() {
    COUNT=$(ps -ef | grep $1 | grep -v "grep" | wc -l)
    if [ $COUNT -eq 0 ]; then
        return 0
    else
        return 1
    fi
}

killProcess() {
    # Stop main program
    PROCESS=$(ps -ef | grep $sofname|grep -v grep | grep -v PPID | awk '{ print $2}')
    for i in $PROCESS; do
        echo "Kill the $1 process [ $i ]"
        kill -9 $i
    done
}

kill_wdog(){
    # Stop watchdog
    PROCESS=$(ps -ef | grep $wdog|grep -v grep | grep -v PPID | awk '{ print $2}')
    for i in $PROCESS; do
        echo "Kill the $1 process [ $i ]"
        kill -9 $i
    done
}

install() {
    OsSupport
    if [ ! -f "$installfolder" ]; then
        wget $download_url
        if [ -f "$version.tar.gz" ]; then
            tar -zxvf $version.tar.gz
            cd $pkgname-$path_version/
            tar -zxvf fxminerproxyv3linux.tar.gz
            mkdir fxpool-$sofname && chmod 777 fxpool-$sofname
            # Check if folder created successfully
            if [ ! -d "fxpool-$sofname" ]; then
                echo && echo -n -e "${yellow}Installation failed, please try again: ${plain}" && read temp
                rm -rf $pkgname-$path_version && rm $version.tar.gz
                return
            fi
            mv fxminerproxyv3linux/$sofname fxpool-$sofname
            mv fxminerproxyv3linux/running.sh fxpool-$sofname/$wdog
            cd fxpool-$sofname && chmod +x $wdog && chmod +x $sofname && cd ../
            cp -r fxpool-$sofname /etc/ && cd ../
            rm -rf $pkgname-$path_version && rm $version.tar.gz
            if [ ! -f "$installfolder" ]; then
                rm -rf  $installdir
                echo -e "${red}Installation failed, please run the one-click installation script again"
                return
            fi
            changeLimit="n"
            if [ $(grep -c "root soft nofile" /etc/security/limits.conf) -eq '0' ]; then
                echo "root soft nofile 65535" >>/etc/security/limits.conf
                echo "* soft nofile 65535" >>/etc/security/limits.conf
                changeLimit="y"
            fi
            if [ $(grep -c "root hard nofile" /etc/security/limits.conf) -eq '0' ]; then
                echo "root hard nofile 65535" >>/etc/security/limits.conf
                echo "* hard nofile 65535" >>/etc/security/limits.conf
                changeLimit="y"
            fi
            if [ $(grep -c "DefaultLimitNOFILE=65535" /etc/systemd/user.conf) -eq '0' ]; then
                echo "DefaultLimitNOFILE=65535" >>/etc/systemd/user.conf
                changeLimit="y"
            fi
            if [ $(grep -c "DefaultLimitNOFILE=65535" /etc/systemd/system.conf) -eq '0' ]; then
                echo "DefaultLimitNOFILE=65535" >>/etc/systemd/system.conf
                changeLimit="y"
            fi
            if [[ "$changeLimit" = "y" ]]; then
                echo "Connection limit changed to 65535, effective after server reboot"
            else
                echo -n "Current connection limit: "
                ulimit -n
            fi
            autorun
            echo && echo -n -e "${yellow}Installation complete, press Enter to start, CTRL+C to exit: ${plain}" && read temp
            start
        else
            echo -e "${red}Failed to download installation package, please run the one-click installation script again"
            echo -e "${yellow}Try using the backup script: >> bash <(curl -s -L https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/install_zh.sh) backline <<"
            rm -rf $pkgname-$path_version && rm $version.tar.gz
            return
        fi
    else
        echo -e "${red}Proxy is already installed, do not reinstall ${plain}"
        before_show_menu
    fi
}

check_install() {
    if [ ! -f "$installfolder" ]; then
        echo -e "             ${red}<<Proxy not installed>> ${plain}"
    else
        echo -e "             ${green}<<Proxy already installed>> ${plain}"
    fi
}

before_show_menu() {
    echo && echo -n -e "${yellow}Operation complete, press Enter to return to main menu: ${plain}" && read temp
    show_menu
}

update_app() {
    if [ ! -f "$installfolder" ]; then
        echo -e "${red}Proxy not installed, please install first"
        before_show_menu
    fi
    echo && echo -n -e "${yellow}Confirm update? Press Enter to confirm, CTRL+C to exit: ${plain}" && read temp
    wget $download_url
    if [ ! -f "$version.tar.gz" ]; then
        echo -e "${red}Failed to download installation package, please run the one-click installation script again to update"
        echo -e "${yellow}Try using the backup script: >> bash <(curl -s -L https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/install_zh.sh) backline <<"
        return
    fi
    rm /etc/fxpool-$sofname/*.cache
    kill_wdog
    killProcess
    tar -zxvf $version.tar.gz
    cd $pkgname-$path_version/
    tar -zxvf fxminerproxyv3linux.tar.gz
    mkdir fxpool-$sofname && chmod 777 fxpool-$sofname
    # Check if folder created successfully
    if [ ! -d "fxpool-$sofname" ]; then
        echo && echo -n -e "${yellow}Update failed, please try again. Press Enter to return to main menu: ${plain}" && read temp
        show_menu
    else
        mv fxminerproxyv3linux/$sofname fxpool-$sofname
        mv fxminerproxyv3linux/running.sh fxpool-$sofname/$wdog
        cd fxpool-$sofname && chmod +x $wdog && chmod +x $sofname && cd ../
        # Check if rename successful
        if [ ! -f "fxpool-$sofname/$wdog" ]; then
            echo && echo -n -e "${yellow}Update failed, rename failed, please try again: ${plain}" && read temp
            rm -rf $pkgname-$path_version && rm $version.tar.gz
            return
        fi
        cp -r fxpool-$sofname /etc/ && cd ../
        rm -rf $pkgname-$path_version && rm $version.tar.gz
        if [ ! -f "$installfolder" ]; then
            echo && echo -n -e "${yellow}Update failed, please run script manually"
            rm -rf $pkgname-$path_version && rm $version.tar.gz
            return
        else
            #echo && echo -n -e "${yellow}Update complete, press Enter to start, CTRL+C to exit: ${plain}" && read temp
            autorun
            start
        fi
    fi
}
uninstall_app() {
    echo && echo -n -e "${yellow}Confirm uninstall? Press Enter to confirm, CTRL+C to exit: ${plain}" && read temp
    kill_wdog
    killProcess
    rm -rf /etc/fxpool-$sofname/
    before_show_menu
}
start() {
    if [ ! -f "$installfolder" ]; then
        echo -e "${red}Proxy not installed, cannot start ${plain}"
    else
        checkProcess "$wdog"
        if [ $? -eq 1 ]; then
            echo -e "${red}Proxy already started, do not restart ${plain}"
            before_show_menu
        else
            echo -e "${green}Starting... ${plain}"
            cd $installdir
            sed -i 's/"is_open_general_swap": true/"is_open_general_swap": false/g' localconfig.json
            sed -i 's/"language": "zh"/"language": "en"/g' localconfig.json
            echo -e ${clearscr}
            setsid ./$wdog -language=en &
            sleep 3
        fi
    fi
    before_show_menu
}
stop() {
    echo && echo -n -e "${yellow}Confirm stop? Press Enter to confirm, CTRL+C to exit: ${plain}" && read temp
    kill_wdog
    killProcess
    before_show_menu
}
autorun() {
    if grep -Eqii "CentOS" /etc/issue || grep -Eq "CentOS" /etc/*-release; then
        DISTRO='CentOS'
        PM='yum'
    elif grep -Eqi "Red Hat Enterprise Linux Server" /etc/issue || grep -Eq "Red Hat Enterprise Linux Server" /etc/*-release; then
        DISTRO='RHEL'
        PM='yum'
    elif grep -Eqi "Aliyun" /etc/issue || grep -Eq "Aliyun" /etc/*-release; then
        DISTRO='Aliyun'
        PM='yum'
    elif grep -Eqi "Fedora" /etc/issue || grep -Eq "Fedora" /etc/*-release; then
        DISTRO='Fedora'
        PM='yum'
    elif grep -Eqi "Debian" /etc/issue || grep -Eq "Debian" /etc/*-release; then
        DISTRO='Debian'
        PM='apt'
    elif grep -Eqi "Ubuntu" /etc/issue || grep -Eq "Ubuntu" /etc/*-release; then
        DISTRO='Ubuntu'
        PM='apt'
    elif grep -Eqi "Raspbian" /etc/issue || grep -Eq "Raspbian" /etc/*-release; then
        DISTRO='Raspbian'
        PM='apt'
    else
        DISTRO='unknow'
    fi
    str1="Raspbian,Ubuntu,Debian"
    if [[ $str1 =~ $DISTRO ]]
    then
        cd /etc
        rm rc.local
        touch rc.local
        chmod 777 rc.local
        echo "#!/bin/bash" >>rc.local
        echo "#" >>rc.local
        echo "# rc.local" >>rc.local
        echo "#" >>rc.local
        echo "# This script is executed at the end of each multiuser runlevel." >>rc.local
        echo "# Make sure that the script will " #exit 0" on success or any other" >> rc.local
        echo "# value on error." >>rc.local
        echo "#" >>rc.local
        echo "# In order to enable or disable this script just change the execution" >>rc.local
        echo "# bits." >>rc.local
        echo "#" >>rc.local
        echo "# By default this script does nothing." >>rc.local
        echo "#exit 0" >>rc.local
        echo "cd $installdir && setsid ./$wdog &" >>rc.local
        echo "exit 0" >>rc.local
        cd /root
        echo -e "${green}Auto-start setup successful, Linux distribution: $DISTRO  ${plain}"
    else
        cd /etc/rc.d/
        rm rc.local
        touch rc.local
        chmod 777 rc.local
        echo "#!/bin/bash" >>rc.local
        echo "cd $installdir && setsid ./$wdog &" >>rc.local
        echo "exit 0" >>rc.local
        cd /root
        echo -e "${green}Auto-start setup successful, Linux distribution: $DISTRO  ${plain}"
    fi
}
closeWhiteList(){
    cd $installdir
    sed -i 's/"is_open_white_list_mode": true/"is_open_white_list_mode": false/g' localconfig.json
    echo -e "${green}Disabled successfully"
}
checkConfigFile(){
    cat /etc/fxpool-fxminerproxyv3/localconfig.json
}
delErrFile(){
    echo "" >/etc/fxpool-fxminerproxyv3/error.log
    echo -e "${green}Deleted successfully${plain}"
}
show_menu() {
    clear
    check_install
    echo -e "
     ${yellow}Note: If you previously installed pirated software (nbminerproxy), please reinstall the operating system first, otherwise it will affect the hashrate
     ${green}$uiname script management interface installation complete (recommended to use debian8.* for better memory control)
     ${green}Line:${router_line}
     ${green}Script Version${shell_version}
     ${green}Software Version${version}
     ${green}During installation, the default Linux max connections have been changed to 65535 (requires server reboot to take effect)
     ${green}Auto-start has been set up during installation
     ${red}Browser default port, username and password are all randomly generated. They will be printed on the console after successful startup. Please pay attention${plain}
     ${green}0.${plain} Exit
     ${green}1.${plain} Install
     ${green}2.${plain} Update
     ${green}3.${plain} Uninstall
     ${green}4.${plain} Start
     ${green}5.${plain} Stop
     ${green}6.${plain} Check Linux max connections
     ${green}7.${plain} Change Linux max connections to 65535 (requires server reboot)
     ${green}8.${plain} Manually set auto-start
     ${green}9.${plain} Disable IP whitelist (re-login after disabling)
     ${green}10.${plain} View configuration file (login info, etc.)
     ${green}11.${plain} Delete error log
    
   "
    echo && read -p "Please enter choice [0-11]: " num

    case "${num}" in
    0)
        exit 0
        ;;
    1)
        install
        ;;
    2)
        update_app
        ;;
    3)
        uninstall_app
        ;;
    4)
        start
        ;;
    5)
        stop
        ;;
    6)
        check_limit
        ;;
    7)
        change_limit
        ;;
    8)
        autorun
        ;;
    9)
        closeWhiteList
        ;;
    10)
        checkConfigFile
        ;;
    11)
        delErrFile
        ;;    
    *)
        echo -e "${red}Please enter correct number [0-11]${plain}"
        ;;
    esac
}
show_menu
