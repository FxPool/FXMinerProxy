#bin
version='8.3.3.1'
shell_version='3.2.1'
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

#检查当前下载的文件收有记录
if [ ! -f "$myFile" ]; then
    echo "\n"
else
    rm $version.tar.gz
fi
#停止老版本
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
        echo "The connection limit is changed to 65535. The value takes effect after the server is restarted"
    else
        echo -n "Current connection limit:"
        ulimit -n
    fi
    before_show_menu
}

check_limit() {
    echo "Current system limit connections:"
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
    #停止主程序
    PROCESS=$(ps -ef | grep $sofname|grep -v grep | grep -v PPID | awk '{ print $2}')
    for i in $PROCESS; do
        echo "Kill the $1 process [ $i ]"
        kill -9 $i
    done
}

kill_wdog(){
    #停止看门狗
    PROCESS=$(ps -ef | grep $wdog|grep -v grep | grep -v PPID | awk '{ print $2}')
    for i in $PROCESS; do
        echo "Kill the $1 process [ $i ]"
        kill -9 $i
    done
}

install() {
    if [ ! -f "$installfolder" ]; then
        wget https://github.com/$authorname/$pkgname/archive/refs/tags/$version.tar.gz
        if [ -f "$version.tar.gz" ]; then
            tar -zxvf $version.tar.gz
            cd $pkgname-$version/
            tar -zxvf fxminerproxyv3linux.tar.gz
            mkdir fxpool-$sofname && chmod 777 fxpool-$sofname
            #判断文件夹是否创建成功
            if [ ! -d "fxpool-$sofname" ]; then
                echo && echo -n -e "${yellow}Installation failed. Please try again: ${plain}" && read temp
                return
            fi
            mv fxminerproxyv3linux/$sofname fxpool-$sofname
            mv fxminerproxyv3linux/running.sh fxpool-$sofname/$wdog
            cd fxpool-$sofname && chmod +x $wdog && chmod +x $sofname && cd ../
            cp -r fxpool-$sofname /etc/ && cd ../
            rm -rf $pkgname-$version && rm $version.tar.gz
            if [ ! -f "$installfolder" ]; then
                rm -rf  $installdir
                echo -e "${red}The installation fails. Enter the one-click installation script to reinstall it"
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
                echo "The connection limit is changed to 65535. The value takes effect after the server is restarted"
            else
                echo -n "Current connection limit:"
                ulimit -n
            fi
            autorun
            echo && echo -n -e "${yellow}When the installation is complete, press Enter to start,CTRL+C to exit: ${plain}" && read temp
            start
        else
            echo -e "${red}Failed to download the installation package. Enter the auto installation script to reinstall it"
            retutn
        fi
    else
        echo -e "${red}App is already installed. Do not install it again"
        before_show_menu
    fi
}

check_install() {
    if [ ! -f "$installfolder" ]; then
        echo -e "             ${red}<<App is not installed>>"
    else
        echo -e "             ${green}<<App has been installed>>"
    fi
}

before_show_menu() {
    echo && echo -n -e "${yellow}After operation, press Enter to return to the main menu: ${plain}" && read temp
    show_menu
}

update_app() {
    if [ ! -f "$installfolder" ]; then
        echo -e "${red}Appis not installed. Please install app first"
        before_show_menu
    fi
    echo && echo -n -e "${yellow}Are you sure to update, press Enter to confirm,CTRL+C to exit: ${plain}" && read temp
    wget https://github.com/$authorname/$pkgname/archive/refs/tags/$version.tar.gz
    if [ ! -f "$version.tar.gz" ]; then
        echo -e "${red}Failed to download the installation package. Please enter the auto installation script to update it again"
        retutn
    fi
    rm /etc/fxpool-$sofname/*.cache
    kill_wdog
    killProcess
    tar -zxvf $version.tar.gz
    cd $pkgname-$version/
    tar -zxvf fxminerproxyv3linux.tar.gz
    mkdir fxpool-$sofname && chmod 777 fxpool-$sofname
    #判断文件夹是否创建成功
    if [ ! -d "fxpool-$sofname" ]; then
        echo && echo -n -e "${yellow}Update failed, please re-operate, press Enter to return to the main menu: ${plain}" && read temp
        show_menu
    else
        mv fxminerproxyv3linux/$sofname fxpool-$sofname
        mv fxminerproxyv3linux/running.sh fxpool-$sofname/$wdog
        cd fxpool-$sofname && chmod +x $wdog && chmod +x $sofname && cd ../
        #判断重命名是否成功
        if [ ! -f "fxpool-$sofname/$wdog" ]; then
            echo && echo -n -e "${yellow}Update failed, rename failed, please try again: ${plain}" && read temp
            return
        fi
        cp -r fxpool-$sofname /etc/ && cd ../
        rm -rf $pkgname-$version && rm $version.tar.gz
        if [ ! -f "$installfolder" ]; then
            echo && echo -n -e "${yellow}Update failed. Please restart script operation"
            return
        else
            echo && echo -n -e "${yellow}When the update is complete, press Enter to start,CTRL+C to exit: ${plain}" && read temp
            autorun
            start
        fi
    fi
}
uninstall_app() {
    echo && echo -n -e "${yellow}Do you want to uninstall it? Press Enter OK,CTRL+C to exit:${plain}" && read temp
    kill_wdog
    killProcess
    rm -rf /etc/fxpool-$sofname/
    before_show_menu
}
start() {
    if [ ! -f "$installfolder" ]; then
        echo -e "${red}App is not installed and cannot be started"
    else
        checkProcess "$wdog"
        if [ $? -eq 1 ]; then
            echo -e "${red}App is already started. Do not start it again"
            before_show_menu
        else
            echo -e "${green}Start..."
            cd $installdir
            sed -i 's/"is_open_general_swap": true/"is_open_general_swap": false/g' localconfig.json
            sed -i 's/"language": "zh"/"language": "en"/g' localconfig.json
            setsid ./$wdog -language=en &
            sleep 3
        fi
    fi
    before_show_menu
}
stop() {
    echo && echo -n -e "${yellow}Are you sure to stop? Press Enter yes,CTRL+C to exit:${plain}" && read temp
    kill_wdog
    killProcess
    before_show_menu
}
autorun() {
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
    echo -e "${green}The startup setting is successful"
}
show_menu() {
    clear
    check_install
    echo -e "
     ${green}$uiname The script management interface is installed
     ${green}Script version:${shell_version}
     ${green}Software version:${version}
     ${green}The default maximum connection value of Linux has been changed to 65535(for this to take effect, restart the server).
     ${green}During installation, the software is automatically set to boot
     ${red}The default port number of the browser is 62438. The default user name and password are admin and admin${plain}
     ${green}0.${plain} exit
     ${green}1.${plain} install
     ${green}2.${plain} update
     ${green}3.${plain} uninstall
     ${green}4.${plain} start
     ${green}5.${plain} stop
     ${green}6.${plain} View the maximum Linux connection
     ${green}7.${plain} Number of Linux connections changed to 65535(the server needs to be restarted to take effect)
     ${green}8.${plain} autorun
    
   "
    echo && read -p "Please enter selection [0-8]: " num

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
    *)
        echo -e "${red}Please enter the correct number [0-8]${plain}"
        ;;
    esac
}
show_menu
