#!/bin/bash

# Language selection
select_language() {
    echo "Please select language / 请选择语言:"
    echo "1. English"
    echo "2. 中文"
    read -p "Enter choice [1-2]: " lang_choice

    case "${lang_choice}" in
    1)
        LANGUAGE="en"
        ;;
    2)
        LANGUAGE="zh"
        ;;
    *)
        echo "Invalid choice, defaulting to English"
        LANGUAGE="en"
        ;;
    esac
}

# Initialize language strings
init_strings() {
    if [ "$LANGUAGE" = "zh" ]; then
        # Chinese strings
        NOT_INSTALLED="<<代理未安装>>"
        ALREADY_INSTALLED="<<代理已安装>>"
        INSTALL_COMPLETE="安装完成，按回车键启动，CTRL+C退出："
        UPDATE_COMPLETE="更新完成，按回车键启动，CTRL+C退出："
        INSTALL_FAILED="安装失败，请重试："
        UPDATE_FAILED="更新失败，请重试："
        DOWNLOAD_FAILED="下载安装包失败，请再次运行一键安装脚本"
        BACKUP_SCRIPT="尝试使用备用脚本：>> bash <(curl -s -L https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/install_zh.sh) backline <<"
        ALREADY_INSTALLED_MSG="代理已经安装，不要重新安装"
        NOT_INSTALLED_START="代理未安装，无法启动"
        ALREADY_STARTED="代理已经启动，不要重新启动"
        STARTING="启动中..."
        CONFIRM_STOP="确认停止？按回车确认，CTRL+C退出："
        CONFIRM_UNINSTALL="确认卸载？按回车确认，CTRL+C退出："
        CONFIRM_UPDATE="确认更新？按回车确认，CTRL+C退出："
        OPERATION_COMPLETE="操作完成，按回车返回主菜单："
        UNSUPPORTED_OS="检测到不支持的操作系统。推荐：CentOS、Ubuntu 或 Debian。按回车继续安装，CTRL+C退出："
        CONNECTION_LIMIT_CHANGED="连接限制已更改为65535，服务器重启后生效"
        CURRENT_CONNECTION_LIMIT="当前连接限制："
        AUTO_START_SUCCESS="开机自启设置成功，Linux发行版："
        WHITELIST_DISABLED="禁用成功"
        LOG_DELETED="删除成功"
        ENTER_CHOICE="请输入选择 [0-11]："
        INVALID_CHOICE="请输入正确的数字 [0-11]"
        PIRATED_WARNING="注意：如果您之前安装过盗版软件（nbminerproxy），请先重装操作系统，否则会影响算力"
        BROWSER_WARNING="浏览器默认端口、用户名和密码均为随机生成。成功启动后会打印在控制台，请注意"
        # 新增菜单翻译
        MENU_TITLE="脚本管理界面安装完成（推荐使用debian8.*以获得更好的内存控制）"
        MENU_LINE="线路："
        MENU_SCRIPT_VERSION="脚本版本"
        MENU_SOFTWARE_VERSION="软件版本"
        MENU_CONNECTION_INFO="安装过程中已将Linux最大连接数默认改为65535（需要服务器重启生效）"
        MENU_AUTOSTART_INFO="安装过程中已设置开机自启"
        MENU_EXIT="退出"
        MENU_INSTALL="安装"
        MENU_UPDATE="更新"
        MENU_UNINSTALL="卸载"
        MENU_START="启动"
        MENU_STOP="停止"
        MENU_CHECK_CONNECTIONS="检查Linux最大连接数"
        MENU_CHANGE_CONNECTIONS="修改Linux最大连接数为65535（需要服务器重启）"
        MENU_SET_AUTOSTART="手动设置开机自启"
        MENU_DISABLE_WHITELIST="禁用IP白名单（禁用后需重新登录）"
        MENU_VIEW_CONFIG="查看配置文件（登录信息等）"
        MENU_DELETE_LOG="删除错误日志"
    else
        # English strings (default)
        NOT_INSTALLED="<<Proxy not installed>>"
        ALREADY_INSTALLED="<<Proxy already installed>>"
        INSTALL_COMPLETE="Installation complete, press Enter to start, CTRL+C to exit: "
        UPDATE_COMPLETE="Update complete, press Enter to start, CTRL+C to exit: "
        INSTALL_FAILED="Installation failed, please try again: "
        UPDATE_FAILED="Update failed, please try again: "
        DOWNLOAD_FAILED="Failed to download installation package, please run the one-click installation script again"
        BACKUP_SCRIPT="Try using the backup script: >> bash <(curl -s -L https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/install_zh.sh) backline <<"
        ALREADY_INSTALLED_MSG="Proxy is already installed, do not reinstall"
        NOT_INSTALLED_START="Proxy not installed, cannot start"
        ALREADY_STARTED="Proxy already started, do not restart"
        STARTING="Starting..."
        CONFIRM_STOP="Confirm stop? Press Enter to confirm, CTRL+C to exit: "
        CONFIRM_UNINSTALL="Confirm uninstall? Press Enter to confirm, CTRL+C to exit: "
        CONFIRM_UPDATE="Confirm update? Press Enter to confirm, CTRL+C to exit: "
        OPERATION_COMPLETE="Operation complete, press Enter to return to main menu: "
        UNSUPPORTED_OS="Unsupported OS detected. Recommended: CentOS, Ubuntu, or Debian. Press Enter to continue installation, CTRL+C to exit: "
        CONNECTION_LIMIT_CHANGED="Connection limit changed to 65535, effective after server reboot"
        CURRENT_CONNECTION_LIMIT="Current connection limit: "
        AUTO_START_SUCCESS="Auto-start setup successful, Linux distribution: "
        WHITELIST_DISABLED="Disabled successfully"
        LOG_DELETED="Deleted successfully"
        ENTER_CHOICE="Please enter choice [0-11]: "
        INVALID_CHOICE="Please enter correct number [0-11]"
        PIRATED_WARNING="Note: If you previously installed pirated software (nbminerproxy), please reinstall the operating system first, otherwise it will affect the hashrate"
        BROWSER_WARNING="Browser default port, username and password are all randomly generated. They will be printed on the console after successful startup. Please pay attention"
        # New menu translations
        MENU_TITLE="script management interface installation complete (recommended to use debian8.* for better memory control)"
        MENU_LINE="Line:"
        MENU_SCRIPT_VERSION="Script Version"
        MENU_SOFTWARE_VERSION="Software Version"
        MENU_CONNECTION_INFO="During installation, the default Linux max connections have been changed to 65535 (requires server reboot to take effect)"
        MENU_AUTOSTART_INFO="Auto-start has been set up during installation"
        MENU_EXIT="Exit"
        MENU_INSTALL="Install"
        MENU_UPDATE="Update"
        MENU_UNINSTALL="Uninstall"
        MENU_START="Start"
        MENU_STOP="Stop"
        MENU_CHECK_CONNECTIONS="Check Linux max connections"
        MENU_CHANGE_CONNECTIONS="Change Linux max connections to 65535 (requires server reboot)"
        MENU_SET_AUTOSTART="Manually set auto-start"
        MENU_DISABLE_WHITELIST="Disable IP whitelist (re-login after disabling)"
        MENU_VIEW_CONFIG="View configuration file (login info, etc.)"
        MENU_DELETE_LOG="Delete error log"
    fi
}

version='v15.3.6@251227'

if [ -n "$1" ]; then
    version=$1
fi

convert_version() {
    local version="$1"
    
    # Remove leading 'v'
    version="${version#v}"
    
    # Replace '@' with '-'
    version="${version//@/-}"
    
    echo "$version"
}

path_version=$(convert_version "$version")

shell_version='6.1.0'
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

download_url=https://github.com/$authorname/$pkgname/archive/refs/tags/$version.tar.gz
router_line='Default'

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
       return
    else
       echo && echo -n -e "${yellow}${UNSUPPORTED_OS}${plain}" && read temp
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
        echo "${CONNECTION_LIMIT_CHANGED}"
    else
        echo -n "${CURRENT_CONNECTION_LIMIT}"
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
                echo && echo -n -e "${yellow}${INSTALL_FAILED}${plain}" && read temp
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
                echo -e "${red}${INSTALL_FAILED}"
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
                echo "${CONNECTION_LIMIT_CHANGED}"
            else
                echo -n "${CURRENT_CONNECTION_LIMIT}"
                ulimit -n
            fi
            autorun
            echo && echo -n -e "${yellow}${INSTALL_COMPLETE}${plain}" && read temp
            start
        else
            echo -e "${red}${DOWNLOAD_FAILED}"
            echo -e "${yellow}${BACKUP_SCRIPT}"
            rm -rf $pkgname-$path_version && rm $version.tar.gz
            return
        fi
    else
        echo -e "${red}${ALREADY_INSTALLED_MSG} ${plain}"
        before_show_menu
    fi
}

check_install() {
    if [ ! -f "$installfolder" ]; then
        echo -e "             ${red}${NOT_INSTALLED} ${plain}"
    else
        echo -e "             ${green}${ALREADY_INSTALLED} ${plain}"
    fi
}

before_show_menu() {
    echo && echo -n -e "${yellow}${OPERATION_COMPLETE}${plain}" && read temp
    show_menu
}

update_app() {
    if [ ! -f "$installfolder" ]; then
        echo -e "${red}Proxy not installed, please install first"
        before_show_menu
    fi
    echo && echo -n -e "${yellow}${CONFIRM_UPDATE}${plain}" && read temp
    wget $download_url
    if [ ! -f "$version.tar.gz" ]; then
        echo -e "${red}${DOWNLOAD_FAILED}"
        echo -e "${yellow}${BACKUP_SCRIPT}"
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
        echo && echo -n -e "${yellow}${UPDATE_FAILED}${plain}" && read temp
        show_menu
    else
        mv fxminerproxyv3linux/$sofname fxpool-$sofname
        mv fxminerproxyv3linux/running.sh fxpool-$sofname/$wdog
        cd fxpool-$sofname && chmod +x $wdog && chmod +x $sofname && cd ../
        # Check if rename successful
        if [ ! -f "fxpool-$sofname/$wdog" ]; then
            echo && echo -n -e "${yellow}${UPDATE_FAILED}${plain}" && read temp
            rm -rf $pkgname-$path_version && rm $version.tar.gz
            return
        fi
        cp -r fxpool-$sofname /etc/ && cd ../
        rm -rf $pkgname-$path_version && rm $version.tar.gz
        if [ ! -f "$installfolder" ]; then
            echo && echo -n -e "${yellow}${UPDATE_FAILED}"
            rm -rf $pkgname-$path_version && rm $version.tar.gz
            return
        else
            autorun
            start
        fi
    fi
}

uninstall_app() {
    echo && echo -n -e "${yellow}${CONFIRM_UNINSTALL}${plain}" && read temp
    kill_wdog
    killProcess
    rm -rf /etc/fxpool-$sofname/
    before_show_menu
}

start() {
    if [ ! -f "$installfolder" ]; then
        echo -e "${red}${NOT_INSTALLED_START} ${plain}"
    else
        checkProcess "$wdog"
        if [ $? -eq 1 ]; then
            echo -e "${red}${ALREADY_STARTED} ${plain}"
            before_show_menu
        else
            echo -e "${green}${STARTING} ${plain}"
            cd $installdir
            sed -i 's/"is_open_general_swap": true/"is_open_general_swap": false/g' localconfig.json
            if [ "$LANGUAGE" = "en" ]; then
                sed -i 's/"language": "zh"/"language": "en"/g' localconfig.json
                 setsid ./$wdog -language=en &
            else
                 sed -i 's/"language": "en"/"language": "zh"/g' localconfig.json
                  setsid ./$wdog -language=zh &
            fi
            echo -e ${clearscr}
            sleep 3
        fi
    fi
    before_show_menu
}

stop() {
    echo && echo -n -e "${yellow}${CONFIRM_STOP}${plain}" && read temp
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
        echo -e "${green}${AUTO_START_SUCCESS} $DISTRO  ${plain}"
    else
        cd /etc/rc.d/
        rm rc.local
        touch rc.local
        chmod 777 rc.local
        echo "#!/bin/bash" >>rc.local
        echo "cd $installdir && setsid ./$wdog &" >>rc.local
        echo "exit 0" >>rc.local
        cd /root
        echo -e "${green}${AUTO_START_SUCCESS} $DISTRO  ${plain}"
    fi
}

closeWhiteList(){
    cd $installdir
    sed -i 's/"is_open_white_list_mode": true/"is_open_white_list_mode": false/g' localconfig.json
    echo -e "${green}${WHITELIST_DISABLED}"
}

checkConfigFile(){
    cat /etc/fxpool-fxminerproxyv3/localconfig.json
}

delErrFile(){
    echo "" >/etc/fxpool-fxminerproxyv3/error.log
    echo -e "${green}${LOG_DELETED}${plain}"
}

show_menu() {
    clear
    check_install
    echo -e "
     ${yellow}${PIRATED_WARNING}
     ${green}${MENU_TITLE}
     ${green}${MENU_LINE}${router_line}
     ${green}${MENU_SCRIPT_VERSION}${shell_version}
     ${green}${MENU_SOFTWARE_VERSION}${version}
     ${green}${MENU_CONNECTION_INFO}
     ${green}${MENU_AUTOSTART_INFO}
     ${red}${BROWSER_WARNING}${plain}
     ${green}0.${plain} ${MENU_EXIT}
     ${green}1.${plain} ${MENU_INSTALL}
     ${green}2.${plain} ${MENU_UPDATE}
     ${green}3.${plain} ${MENU_UNINSTALL}
     ${green}4.${plain} ${MENU_START}
     ${green}5.${plain} ${MENU_STOP}
     ${green}6.${plain} ${MENU_CHECK_CONNECTIONS}
     ${green}7.${plain} ${MENU_CHANGE_CONNECTIONS}
     ${green}8.${plain} ${MENU_SET_AUTOSTART}
     ${green}9.${plain} ${MENU_DISABLE_WHITELIST}
     ${green}10.${plain} ${MENU_VIEW_CONFIG}
     ${green}11.${plain} ${MENU_DELETE_LOG}
    
   "
    echo && read -p "${ENTER_CHOICE}" num

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
        echo -e "${red}${INVALID_CHOICE}${plain}"
        ;;
    esac
}

# Main execution
select_language
init_strings
show_menu
