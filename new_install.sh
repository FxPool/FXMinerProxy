#!/bin/bash

# 脚本配置
version='v15.4.0@260114'
shell_version='7.0.0'
pkgname='FXMinerProxy'
authorname='FxPool'
sofname='fxminerproxyv3'
service_name='fxminerproxyv3'
install_dir='/opt/fxminerproxyv3'
download_url="https://github.com/$authorname/$pkgname/archive/refs/tags/$version.tar.gz"

# 颜色定义
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'

# 检查root权限
check_root() {
    if [[ $EUID -ne 0 ]]; then
        echo -e "${red}错误: 此脚本必须以root用户身份运行${plain}"
        exit 1
    fi
}

# 设置系统限制
set_system_limits() {
    echo -e "${green}正在设置系统连接数限制...${plain}"
    
    # 设置limits.conf
    if ! grep -q "^* *soft *nofile" /etc/security/limits.conf; then
        echo "* soft nofile 1048576" >> /etc/security/limits.conf
    fi
    if ! grep -q "^* *hard *nofile" /etc/security/limits.conf; then
        echo "* hard nofile 1048576" >> /etc/security/limits.conf
    fi
    
    # 设置systemd配置
    mkdir -p /etc/systemd/system.conf.d/
    echo -e "[Manager]\nDefaultLimitNOFILE=1048576" > /etc/systemd/system.conf.d/limits.conf
    
    # 应用设置
    sysctl -p >/dev/null 2>&1
    systemctl daemon-reload
    
    echo -e "${green}系统连接数限制已设置为1048576${plain}"
}

# 清理旧版本
clean_old_versions() {
    echo -e "${yellow}正在清理旧版本...${plain}"
    
    # 停止旧服务
    if systemctl is-active --quiet $service_name; then
        systemctl stop $service_name
        systemctl disable $service_name
    fi
    
    # 删除旧文件
    rm -rf $install_dir
    rm -rf /etc/systemd/system/${service_name}.service
    
    # 清理rc.local
    if [ -f /etc/rc.local ]; then
        sed -i "/fxminerproxyv3/d" /etc/rc.local
    fi
    
    echo -e "${green}旧版本清理完成${plain}"
}

# 安装依赖
install_dependencies() {
    echo -e "${green}正在安装依赖...${plain}"
    
    if [ -x "$(command -v apt-get)" ]; then
        apt-get update
        apt-get install -y wget tar
    elif [ -x "$(command -v yum)" ]; then
        yum install -y wget tar
    else
        echo -e "${yellow}无法确定包管理器，跳过依赖安装${plain}"
    fi
}

# 下载并安装
install_fxminerproxy() {
    echo -e "${green}开始安装FXMinerProxy v${version}...${plain}"
    
    # 创建安装目录
    mkdir -p $install_dir
    cd /tmp
    
    # 下载源码
    if ! wget -O ${version}.tar.gz $download_url; then
        echo -e "${red}下载失败，请检查网络连接${plain}"
        exit 1
    fi
    
    # 解压文件
    tar -zxvf ${version}.tar.gz
    cd ${pkgname}-${version}
    
    if [ ! -f "fxminerproxyv3linux.tar.gz" ]; then
        echo -e "${red}未找到fxminerproxyv3linux.tar.gz文件${plain}"
        exit 1
    fi
    
    tar -zxvf fxminerproxyv3linux.tar.gz
    cd fxminerproxyv3linux
    
    # 复制文件到安装目录
    cp -f $sofname $install_dir/
    chmod +x $install_dir/$sofname
    
    # 清理临时文件
    cd /tmp
    rm -rf ${version}.tar.gz ${pkgname}-${version}
    
    echo -e "${green}FXMinerProxy安装完成${plain}"
}

# 创建服务文件
create_service() {
    echo -e "${green}正在创建系统服务...${plain}"
    
    cat > /etc/systemd/system/${service_name}.service <<EOF
[Unit]
Description=FXMinerProxy v3 Service
After=network.target

[Service]
Type=simple
User=root
WorkingDirectory=$install_dir
ExecStart=$install_dir/$sofname
Restart=always
RestartSec=5s
LimitNOFILE=1048576

[Install]
WantedBy=multi-user.target
EOF

    # 重载systemd
    systemctl daemon-reload
    systemctl enable $service_name
    
    echo -e "${green}系统服务创建完成${plain}"
}

# 启动服务
start_service() {
    echo -e "${green}正在启动服务...${plain}"
    systemctl start $service_name
    sleep 2
    
    if systemctl is-active --quiet $service_name; then
        echo -e "${green}服务启动成功${plain}"
    else
        echo -e "${red}服务启动失败${plain}"
        journalctl -u $service_name -n 10 --no-pager
    fi
}

# 显示服务状态
show_status() {
    systemctl status $service_name --no-pager -l
}

# 卸载服务
uninstall_service() {
    echo -e "${yellow}正在卸载FXMinerProxy...${plain}"
    
    if systemctl is-active --quiet $service_name; then
        systemctl stop $service_name
    fi
    
    if systemctl is-enabled --quiet $service_name; then
        systemctl disable $service_name
    fi
    
    rm -f /etc/systemd/system/${service_name}.service
    systemctl daemon-reload
    
    rm -rf $install_dir
    
    echo -e "${green}FXMinerProxy已卸载${plain}"
}

# 显示菜单
show_menu() {
    clear
    echo -e "
  ${green}FXMinerProxy 管理脚本${plain}
  ${green}版本: ${shell_version}${plain}
  ${green}软件版本: ${version}${plain}
  
  ${green}1.${plain} 安装 FXMinerProxy
  ${green}2.${plain} 启动服务
  ${green}3.${plain} 停止服务
  ${green}4.${plain} 重启服务
  ${green}5.${plain} 查看服务状态
  ${green}6.${plain} 设置系统限制
  ${green}7.${plain} 卸载 FXMinerProxy
  ${green}0.${plain} 退出脚本
 "
    echo && read -p "请输入选项 [0-7]: " num

    case "$num" in
        0)
            exit 0
            ;;
        1)
            check_root
            set_system_limits
            clean_old_versions
            install_dependencies
            install_fxminerproxy
            create_service
            start_service
            ;;
        2)
            systemctl start $service_name
            show_status
            ;;
        3)
            systemctl stop $service_name
            show_status
            ;;
        4)
            systemctl restart $service_name
            show_status
            ;;
        5)
            show_status
            ;;
        6)
            check_root
            set_system_limits
            ;;
        7)
            check_root
            uninstall_service
            ;;
        *)
            echo -e "${red}请输入正确的选项 [0-7]${plain}"
            ;;
    esac
}

# 主函数
main() {
    check_root
    while true; do
        show_menu
        echo
        read -p "按回车键返回菜单..." input
    done
}

main
