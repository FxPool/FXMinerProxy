#bin
version='7.0.1.5'
shell_version='2.3.0'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'
myFile=$version.tar.gz
installfolder='/etc/porttran'

if [ ! -f "$myFile" ]; then
echo "\n"
else
rm $version.tar.gz
fi

kill_porttran(){
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
   wget http://download.transitpool.org/porttraninstall/$version.tar.gz
   tar -zxvf $version.tar.gz
   cd porttran-$version/porttranpay
   tar -zxvf porttranlatest.tar.gz
   cd ../..
   mv porttran-$version/porttranpay/porttran/portdir.sh porttran-$version/porttranpay/porttran/porttran
   mkdir porttran && chmod 777 porttran
   mv porttran-$version/porttranpay/porttran/* porttran
   cd porttran/ && chmod +x porttran && chmod +x ppexec
   cd ../
   rm -rf porttran-$version
   rm $version.tar.gz
   rm porttranfree.sh
   cp -r porttran /etc/
   rm -rf porttran/
   clear
   before_show_menu
}

check_install() {
if [ ! -d "$installfolder" ]; then
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
  wget http://download.transitpool.org/porttraninstall/porttraninstall.sh -O -> /usr/bin/porttran-ui && chmod +x /usr/bin/porttran-ui && porttran-ui
  echo 
  exit 0
}
update_app() {
   kill_porttran
   kill_ppexec
   wget http://download.transitpool.org/porttraninstall/$version.tar.gz
   tar -zxvf $version.tar.gz
   cd porttran-$version/porttranpay
   tar -zxvf porttranlatest.tar.gz
   cd ../..
   mv porttran-$version/porttranpay/porttran/portdir.sh porttran-$version/porttranpay/porttran/porttran
   mkdir porttran && chmod 777 porttran
   mv porttran-$version/porttranpay/porttran/* porttran
   cd porttran/ && chmod +x porttran && chmod +x ppexec
   cd ../
   rm -rf porttran-$version
   rm $version.tar.gz
   rm porttranfree.sh
   rm /etc/porttran/porttran
   rm /etc/porttran/ppexec
   rm -rf /etc/porttran/ui
   cp porttran/ppexec /etc/porttran/
   cp porttran/porttran /etc/porttran/
   cd porttran/
   cp -r ui /etc/porttran
   cd ../
   rm -rf porttran/
   before_show_menu
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
   rm /usr/bin/porttran-ui
   before_show_menu
}
start() {
   cd /etc/porttran
   setsid ./porttran &
   sleep 2
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
      echo "#!/bin/sh -e" >> rc.local
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
      echo "cd /etc/porttran && setsid ./porttran &" >> rc.local
      echo "exit 0" >> rc.local
      cd /root
      echo -e "${green}开机启动设置成功"
      before_show_menu
}
show_menu() {
   clear
     check_install
     echo -e "
     ${green}porttran脚本管理界面安装完成${red}版本${shell_version},转发软件版本${version}
     ${green}更新流程 4,7,2,6
     ${green}若启动错误请 7,6 重启
     ${green}任意目录下输入porttran-ui 启动管理界面
     ${red}转发软件浏览器默认端口62438,默认用户名密码admin,admin${plain}
   ————————————————
     ${green}0.${plain} 退出
   ————————————————
     ${green}1.${plain} 安装转发
     ${green}2.${plain} 更新转发
     ${green}3.${plain} 卸载转发
   ————————————————
     ${green}4.${plain} 更新脚本
     ${green}5.${plain} 卸载脚本
   ————————————————
     ${green}6.${plain} 启动转发
     ${green}7.${plain} 停止转发
     ${green}8.${plain} 开机启动
   ————————————————
   "
    echo && read -p "请输入选择 [0-8]: " num

    case "${num}" in
        0) exit 0
        ;;
        1) install
        ;;
        2) update_app
        ;;
        3) uninstall_app
        ;;
        4) update_shell
        ;;
        5) uninstall_shell
        ;;
        6) start
        ;;
        7) stop
        ;;
        8) autorun
        ;;
        *) echo -e "${red}请输入正确的数字 [0-8]${plain}"
        ;;
    esac
}
show_menu
