#!/bin/bash

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 变量定义
SERVICE_NAME="fxminerproxy"
INSTALL_DIR="/opt/fxminerproxy"
BIN_NAME="fxminerproxyv3"
SERVICE_FILE="/etc/systemd/system/${SERVICE_NAME}.service"
DOWNLOAD_URL="https://github.com/FxPool/FXMinerProxy/archive/refs/tags/v15.4.0@260114.tar.gz"
TEMP_DIR="/tmp/fxminerproxy_install"

# 检查是否root用户
check_root() {
    if [ "$(id -u)" != "0" ]; then
        echo -e "${RED}错误: 此脚本必须以root用户身份运行!${NC}"
        exit 1
    fi
}

# 检查服务是否已安装
is_installed() {
    if [ -f "$SERVICE_FILE" ] || [ -d "$INSTALL_DIR" ]; then
        return 0
    else
        return 1
    fi
}

# 检查服务是否已卸载
is_uninstalled() {
    if [ ! -f "$SERVICE_FILE" ] && [ ! -d "$INSTALL_DIR" ]; then
        return 0
    else
        return 1
    fi
}

# 检查服务是否正在运行
is_running() {
    if systemctl is-active --quiet "$SERVICE_NAME"; then
        return 0
    else
        return 1
    fi
}

# 设置socket连接上限
set_socket_limit() {
    echo -e "${YELLOW}正在设置系统socket连接上限...${NC}"
    local current_limit=$(ulimit -n)
    local target_limit=1048576
    
    if [ "$current_limit" -lt "$target_limit" ]; then
        echo "* soft nofile 1048576" >> /etc/security/limits.conf
        echo "* hard nofile 1048576" >> /etc/security/limits.conf
        echo "fs.file-max = 1048576" >> /etc/sysctl.conf
        sysctl -p > /dev/null
        ulimit -n 1048576
        echo -e "${GREEN}系统socket连接上限已设置为1048576${NC}"
    else
        echo -e "${BLUE}系统socket连接上限已经足够高 (当前: $current_limit)${NC}"
    fi
}

# 下载并解压FXMinerProxy
download_and_extract() {
    echo -e "${YELLOW}正在下载FXMinerProxy...${NC}"
    mkdir -p "$TEMP_DIR"
    wget -q "$DOWNLOAD_URL" -O "$TEMP_DIR/fxminerproxy.tar.gz"
    if [ $? -ne 0 ]; then
        echo -e "${RED}下载失败! 请检查网络连接或URL是否正确.${NC}"
        exit 1
    fi
    
    echo -e "${YELLOW}正在解压文件...${NC}"
    tar -xzf "$TEMP_DIR/fxminerproxy.tar.gz" -C "$TEMP_DIR"
    
    # 查找内部压缩包和解压
    inner_tar=$(find "$TEMP_DIR" -name "fxminerproxyv3linux.tar.gz")
    if [ -z "$inner_tar" ]; then
        echo -e "${RED}错误: 未找到内部压缩包fxminerproxyv3linux.tar.gz${NC}"
        exit 1
    fi
    
    tar -xzf "$inner_tar" -C "$TEMP_DIR"
    
    # 查找二进制文件
    BIN_PATH=$(find "$TEMP_DIR" -name "$BIN_NAME" -type f)
    if [ -z "$BIN_PATH" ]; then
        echo -e "${RED}错误: 未找到可执行文件 $BIN_NAME${NC}"
        exit 1
    fi
    
    chmod +x "$BIN_PATH"
}

# 安装服务
install_service() {
    if is_installed; then
        echo -e "${RED}错误: FXMinerProxy服务已经安装!${NC}"
        echo -e "请先卸载或使用重启/停止功能"
        return 1
    fi
    
    echo -e "${YELLOW}正在安装FXMinerProxy服务...${NC}"
    
    # 创建安装目录
    mkdir -p "$INSTALL_DIR"
    
    # 移动文件到安装目录
    cp "$BIN_PATH" "$INSTALL_DIR/"
    
    # 创建服务文件
    cat > "$SERVICE_FILE" <<EOF
[Unit]
Description=FXMinerProxy Service
After=network.target

[Service]
Type=simple
User=root
WorkingDirectory=$INSTALL_DIR
ExecStart=$INSTALL_DIR/$BIN_NAME
Restart=always
RestartSec=5s
LimitNOFILE=1048576

[Install]
WantedBy=multi-user.target
EOF
    
    # 重载systemd
    systemctl daemon-reload
    systemctl enable "$SERVICE_NAME"
    systemctl start "$SERVICE_NAME"
    
    echo -e "${GREEN}FXMinerProxy服务安装完成!${NC}"
    echo -e "安装目录: ${BLUE}$INSTALL_DIR${NC}"
    echo -e "服务状态: ${BLUE}systemctl status $SERVICE_NAME${NC}"
}

# 卸载服务
uninstall_service() {
    if is_uninstalled; then
        echo -e "${RED}错误: FXMinerProxy服务未安装，无需卸载!${NC}"
        return 1
    fi
    
    echo -e "${YELLOW}正在卸载FXMinerProxy服务...${NC}"
    
    if is_running; then
        systemctl stop "$SERVICE_NAME"
    fi
    
    if systemctl is-enabled --quiet "$SERVICE_NAME"; then
        systemctl disable "$SERVICE_NAME"
    fi
    
    if [ -f "$SERVICE_FILE" ]; then
        rm -f "$SERVICE_FILE"
        systemctl daemon-reload
    fi
    
    if [ -d "$INSTALL_DIR" ]; then
        rm -rf "$INSTALL_DIR"
    fi
    
    echo -e "${GREEN}FXMinerProxy服务已卸载!${NC}"
}

# 启动服务
start_service() {
    if is_running; then
        echo -e "${YELLOW}服务已经在运行中!${NC}"
        return
    fi
    
    systemctl start "$SERVICE_NAME"
    echo -e "${GREEN}服务已启动!${NC}"
}

# 停止服务
stop_service() {
    if ! is_running; then
        echo -e "${YELLOW}服务已经停止!${NC}"
        return
    fi
    
    systemctl stop "$SERVICE_NAME"
    echo -e "${GREEN}服务已停止!${NC}"
}

# 重启服务
restart_service() {
    systemctl restart "$SERVICE_NAME"
    echo -e "${GREEN}服务已重启!${NC}"
    echo -e "服务状态: ${BLUE}systemctl status $SERVICE_NAME${NC}"
}

# 查看服务状态
status_service() {
    systemctl status "$SERVICE_NAME"
}

# 显示菜单
show_menu() {
    clear
    echo -e "${GREEN}================================${NC}"
    echo -e "${GREEN}  FXMinerProxy 服务管理脚本 ${NC}"
    echo -e "${GREEN}================================${NC}"
    echo -e "1. 安装 FXMinerProxy 服务"
    echo -e "2. 启动 FXMinerProxy 服务"
    echo -e "3. 停止 FXMinerProxy 服务"
    echo -e "4. 重启 FXMinerProxy 服务"
    echo -e "5. 查看服务状态"
    echo -e "6. 卸载 FXMinerProxy 服务"
    echo -e "0. 退出"
    echo -e "${GREEN}================================${NC}"
    read -p "请输入选项 [0-6]: " option
}

# 主函数
main() {
    check_root
    
    while true; do
        show_menu
        case $option in
            1)
                set_socket_limit
                download_and_extract
                install_service
                rm -rf "$TEMP_DIR"
                read -p "按任意键继续..."
                ;;
            2)
                start_service
                read -p "按任意键继续..."
                ;;
            3)
                stop_service
                read -p "按任意键继续..."
                ;;
            4)
                restart_service
                read -p "按任意键继续..."
                ;;
            5)
                status_service
                read -p "按任意键继续..."
                ;;
            6)
                uninstall_service
                read -p "按任意键继续..."
                ;;
            0)
                echo -e "${GREEN}退出脚本.${NC}"
                exit 0
                ;;
            *)
                echo -e "${RED}无效选项，请重新输入!${NC}"
                read -p "按任意键继续..."
                ;;
        esac
    done
}

# 执行主函数
main
