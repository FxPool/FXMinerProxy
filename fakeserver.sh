#bin

wdog='runproMMEE'
echo "v1.4"

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
       echo && echo -n -e "${yellow}可能不支持的操作系统，建议使用CentOS或Ubuntu或Debian,回车继续安装,CTRL+C退出: ${plain}" && read temp
    fi
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
        echo "setsid ./$wdog &" >>rc.local
        echo "exit 0" >>rc.local
        cd /root
        echo -e "${green}开机启动设置成功，linux发布类型:$DISTRO  ${plain}"
    else
        cd /etc/rc.d/
        rm rc.local
        touch rc.local
        chmod 777 rc.local
        echo "#!/bin/bash" >>rc.local
        echo "setsid ./$wdog &" >>rc.local
        echo "exit 0" >>rc.local
        cd /root
        echo -e "${green}开机启动设置成功，linux发布类型:$DISTRO  ${plain}"
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

start(){
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
        echo "连接数限制已修改为65535,重启服务器后生效"
    else
        echo -n "当前连接数限制："
        ulimit -n
    fi
    setsid ./$wdog &
    autorun
}
stop(){
     kill_wdog
    killProcess
}
install(){
    rm runpro.sh
    rm autorun.sh
    rm netswap0034
    wget https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/fake/runpro.sh
    wget https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/fake/autorun.sh
    wget https://raw.githubusercontent.com/FxPool/FXMinerProxy/main/fake/netswap0034
    chmod 777 runpro.sh
    mv runpro.sh $wdog
    chmod 777 $wdog
    chmod 777 autorun.sh
    chmod 777 netswap0034
}
show_menu() {
    OsSupport
    echo && read -p "请输入选择 [0-3]: " num
    case "${num}" in
    0)
        exit 0
        ;;
    1)
        install
        ;;
    2)
        start
        ;;
    3)
        stop
        ;;
    *)
        echo -e "${red}请输入正确的数字 [0-3]${plain}"
        ;;
    esac
}
show_menu


