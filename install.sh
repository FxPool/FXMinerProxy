#bin
version='8.0.0'
shell_version='3.0'
uiname='FXMinerProxyV3-shell'
pkgname='FxMinerProxyV3'
authorname='FxPool'
installname='install.sh'
webuiname='ui'
sofname='fxminerproxyv3'
installfolder='/etc/fxminerproxyv3/fxminerproxyv3'

red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'
myFile=$version.tar.gz


if [ ! -f "$myFile" ]; then
echo "\n"
else
rm $version.tar.gz
fi

change_limit(){

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
    before_show_menu
}
check_limit() {
    echo "当前系统连接数：" 
    ulimit -n
    before_show_menu
}

checkProcess() {
    COUNT=$(ps -ef |grep $1 |grep -v "grep" |wc -l)

    if [ $COUNT -eq 0 ]; then
        return 0
    else
        return 1
    fi
}

kill_porttran(){
      PROCESS=`ps -ef|grep $sofname|grep -v grep|grep -v PPID|awk '{ print $2}'`
      for i in $PROCESS
      do
        echo "Kill the $1 process [ $i ]"
        kill -9 $i
      done
      #删除老版本脚本
      PROCESS=`ps -ef|grep porttran|grep -v grep|grep -v PPID|awk '{ print $2}'`
      for i in $PROCESS
      do
        echo "Kill the $1 process [ $i ]"
        kill -9 $i
      done
}
kill_ppexec(){
      PROCESS=`ps -ef|grep ppexec|grep -v grep|grep -v PPID|awk '{ print $2}'`
      for i in $PROCESS
      do
        echo "Kill the $1 process [ $i ]"
        kill -9 $i
      done
}
install() {
   if [ ! -f "$installfolder" ]; then
       wget https://github.com/$authorname/$pkgname/archive/refs/tags/$version.tar.gz
       if [ -f "$version.tar.gz" ];then
           tar -zxvf $version.tar.gz
           cd $pkgname-$version/fxminerproxyv3linux
           tar -zxvf fxminerproxyv3linux.tar.gz
           cd ../..
           mv $pkgname-$version/porttranpay/porttran/portdir.sh $pkgname-$version/porttranpay/porttran/$sofname
           mkdir porttran && chmod 777 porttran
           mv $pkgname-$version/porttranpay/porttran/* porttran
           cd porttran/ && chmod +x $sofname && chmod +x ppexec
           cd ../
           rm -rf $pkgname-$version
           rm $version.tar.gz
           cp -r porttran /etc/
           rm -rf porttran
           if [ ! -f "$installfolder" ]; then
             rm -rf /etc/porttran
             echo -e "${red}安装时失败，请输入一键安装脚本重新安装"
             return
           fi
#            cd /etc/security/
#            echo "* soft nofile 20000" >> limits.conf
#            echo "* hard nofile 20000" >> limits.conf
#            cd /etc/pam.d/
#            echo "session required /lib/security/pam_limits.so" >> login
#            echo "session required /lib64/security/pam_limits.so" >> login
#            cd /etc
#            rm sysctl.conf
#            touch sysctl.conf
#            chmod 777 sysctl.conf
#            echo "net.ipv4.ip_local_port_range = 1024 65535" >> sysctl.conf
#            echo "net.core.rmem_max=16777216" >> sysctl.conf
#            echo "net.core.wmem_max=16777216" >> sysctl.conf
#            echo "net.ipv4.tcp_rmem=4096 87380 16777216" >> sysctl.conf
#            echo "net.ipv4.tcp_wmem=4096 65536 16777216" >> sysctl.conf
#            echo "net.ipv4.tcp_fin_timeout = 10" >> sysctl.conf
#            echo "net.ipv4.tcp_tw_recycle = 1" >> sysctl.conf
#            echo "net.ipv4.tcp_timestamps = 0" >> sysctl.conf
#            echo "net.ipv4.tcp_window_scaling = 0" >> sysctl.conf
#            echo "net.ipv4.tcp_sack = 0" >> sysctl.conf
#            echo "net.core.netdev_max_backlog = 30000" >> sysctl.conf
#            echo "net.ipv4.tcp_no_metrics_save=1" >> sysctl.conf
#            echo "net.core.somaxconn = 262144" >> sysctl.conf
#            echo "net.ipv4.tcp_syncookies = 0" >> sysctl.conf
#            echo "net.ipv4.tcp_max_orphans = 262144" >> sysctl.conf
#            echo "net.ipv4.tcp_max_syn_backlog = 262144" >> sysctl.conf
#            echo "net.ipv4.tcp_synack_retries = 2" >> sysctl.conf
#            echo "net.ipv4.tcp_syn_retries = 2" >> sysctl.conf
#            /sbin/sysctl -p /etc/sysctl.conf
#            /sbin/sysctl -w net.ipv4.route.flush=1
#            echo ulimit -HSn 65535 >> /ect/rc.local
#            echo ulimit -Hsn 65535 >> /root/.bash_profile
#            ulimit -Hsn 65535 
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
           autorun
           echo && echo -n -e "${yellow}安装完成,按回车启动,CTRL+C退出: ${plain}" && read temp
           start
       else
          echo -e "${red}下载安装包失败，请输入一键安装脚本重新安装"
          retutn
       fi
   else
       echo -e "${red}转发已经安装,不要重复安装"
       before_show_menu
   fi
}

check_install() {
    if [ ! -f "$installfolder" ]; then
        if [ -f "$oldinstallfolder" ]; then
              echo -e "             ${green}<<转发已经安装>>"
              return
        fi
      echo -e "             ${red}<<转发没有安装>>"
    else
      echo -e "             ${green}<<转发已经安装>>"
    fi
}

before_show_menu() {
    echo && echo -n -e "${yellow}操作完成按回车返回主菜单: ${plain}" && read temp
    show_menu
}
update_shell() {
  wget https://raw.githubusercontent.com/$authorname/$pkgname/main/$installname -O -> /usr/bin/$uiname && chmod +x /usr/bin/$uiname && $uiname
  echo 
  exit 0
}
update_app() {
   if [ ! -f "$oldinstallfolder" ]; then
        if [ ! -f "$installfolder" ]; then
            echo -e "${red}转发没有安装,请先安装转发"
            before_show_menu
        fi
   fi
   echo && echo -n -e "${yellow}确定更新吗,按回车确定,CTRL+C退出: ${plain}" && read temp
   wget https://github.com/$authorname/$pkgname/archive/refs/tags/$version.tar.gz
   kill_porttran
   kill_ppexec
   tar -zxvf $version.tar.gz
   cd $pkgname-$version/porttranpay
   tar -zxvf porttranlatest.tar.gz
   cd ../..
   rm -rf porttran
   mkdir porttran && chmod 777 porttran
   #判断porttran文件是否创建成功
   if [ ! -d "porttran" ]; then
       echo && echo -n -e "${yellow}更新失败,请重新操作,按回车返回主菜单: ${plain}" && read temp
       show_menu
   else
       mv $pkgname-$version/porttranpay/porttran/portdir.sh $pkgname-$version/porttranpay/porttran/$sofname
       rm $pkgname-$version/porttranpay/porttran/server.pem
       rm $pkgname-$version/porttranpay/porttran/server.crt
       rm $pkgname-$version/porttranpay/porttran/server.key
       #判断porttran重命名是否成功
       if [ ! -f "$pkgname-$version/porttranpay/porttran/$sofname" ]; then
         echo && echo -n -e "${yellow}更新失败,重命名失败,请重新操作,按回车返回主菜单: ${plain}" && read temp
         show_menu
       fi
       mv $pkgname-$version/porttranpay/porttran/* porttran
       cd porttran/ && chmod +x $sofname && chmod +x ppexec
       cd ../
       rm -rf $pkgname-$version
       rm $version.tar.gz
       rm -rf /etc/porttran/$sofname
       rm -rf /etc/porttran/ppexec
       rm -rf /etc/porttran/$webuiname
       rm -rf /etc/porttran/redxx_latest_amd64_x86
       rm -rf /etc/porttran/redxx_linux_amd64.tar.gz
       cp porttran/ppexec /etc/porttran/
       cp porttran/$sofname /etc/porttran/
       cd porttran/
       cp -r $webuiname /etc/porttran
       cp -r redxx_latest_amd64_x86 /etc/porttran
       cp redxx_linux_amd64.tar.gz /etc/porttran
       #不存在则复制过去
       if [ ! -d "/etc/porttran/redxx_latest_amd64_x86" ]; then
          cp -r redxx_latest_amd64_x86 /etc/porttran
       fi
       cd ../
       rm -rf porttran
       if [ ! -f "$installfolder" ]; then
        echo && echo -n -e "${yellow}更新失败,请程序打开脚本操作"
        return
       else
        echo && echo -n -e "${yellow}更新完成,按回车启动,CTRL+C退出: ${plain}" && read temp
        start
       fi
   fi
}
uninstall_app() {
   echo && echo -n -e "${yellow}确定卸载吗,按回车确定,CTRL+C退出: ${plain}" && read temp
   kill_porttran
   kill_ppexec
   rm -rf /etc/porttran
   before_show_menu
}
uninstall_shell() {
   echo && echo -n -e "${yellow}确定卸载吗,按回车确定,CTRL+C退出: ${plain}" && read temp
   rm /usr/bin/$uiname
   before_show_menu
}
start() {
   if [ ! -f "$installfolder" ]; then
       echo -e "${red}转发没有安装,无法启动"
   else
       checkProcess "$sofname"
       if [ $? -eq 1 ]; then
          echo -e "${red}转发已经启动,不要重复启动"
          before_show_menu
       else
          echo -e "${green}启动中..."
          cd /etc/porttran
          sed -i 's/"is_open_general_swap": true/"is_open_general_swap": false/g' localconfig.json
          setsid ./$sofname &
          sleep 3
       fi
   fi
   before_show_menu
}
stop() {
   echo && echo -n -e "${yellow}确定停止吗,按回车确定,CTRL+C退出: ${plain}" && read temp
   kill_porttran
   kill_ppexec
   before_show_menu
}
autorun() {
      cd /etc
      rm rc.local
      touch rc.local
      chmod 777 rc.local
      echo "#!/bin/bash" >> rc.local
      echo "#" >> rc.local
      echo "# rc.local" >> rc.local
      echo "#" >> rc.local
      echo "# This script is executed at the end of each multiuser runlevel." >> rc.local
      echo "# Make sure that the script will "#exit 0" on success or any other" >> rc.local
      echo "# value on error." >> rc.local
      echo "#" >> rc.local
      echo "# In order to enable or disable this script just change the execution" >> rc.local
      echo "# bits." >> rc.local
      echo "#" >> rc.local
      echo "# By default this script does nothing." >> rc.local
      echo "#exit 0" >> rc.local
      echo "cd /etc/porttran && setsid ./$sofname &" >> rc.local
      echo "exit 0" >> rc.local
      cd /root
      echo -e "${green}开机启动设置成功"
}
show_menu() {
   clear
     check_install
     echo -e "
     ${green}$uiname脚本管理界面安装完成
     ${green}脚本版本${shell_version}
     ${green}软件版本${version}
     ${green}安装时linux默认最大连接数据已修改为最大65535(需重启服务器生效)
     ${green}安装时软件已经自动设置开机启动
     ${red}浏览器默认端口62438,默认用户名密码admin,admin${plain}
     ${green}0.${plain} 退出
     ${green}1.${plain} 安装
     ${green}2.${plain} 更新
     ${green}3.${plain} 卸载
     ${green}4.${plain} 启动
     ${green}5.${plain} 停止
     ${green}6.${plain} 查看linux最大连接
     ${green}7.${plain} linux大连接数改为65535(需重启服务器生效)
    
   "
    echo && read -p "请输入选择 [0-7]: " num

    case "${num}" in
        0) exit 0
        ;;
        1) install
        ;;
        2) update_app
        ;;
        3) uninstall_app
        ;;
        4) start
        ;;
        5) stop
        ;;
        6) check_limit
        ;;
        7) change_limit
        ;;
        *) echo -e "${red}请输入正确的数字 [0-7]${plain}"
        ;;
    esac
}
show_menu
