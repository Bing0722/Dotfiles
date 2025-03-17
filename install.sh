#!/bin/bash

clear

download_folder="$HOME/App"

# -----------------------------------------------
# 一些颜色定义
# -----------------------------------------------
GREEN='\033[0;32m'    # 绿色
RED='\033[0;31m'      # 红色
YELLOW='\033[0;33m'   # 黄色
BLUE='\033[0;34m'     # 蓝色
PURPLE='\033[0;35m'   # 紫色
CYAN='\033[0;36m'     # 青色
WHITE='\033[0;37m'    # 白色
BLACK='\033[0;30m'    # 黑色
ORANGE='\033[1;33m'   # 橙色
PINK='\033[1;35m'     # 粉色
GRAY='\033[0;90m'     # 灰色
BOLD='\033[1m'        # 粗体
UNDERLINE='\033[4m'   # 下划线
REVERSE='\033[7m'     # 反转
BLINK='\033[5m'       # 闪烁
ITALIC='\033[3m'      # 斜体
NONE='\033[0m'        # 重置所有属性

# -----------------------------------------------
# 函数定义
# -----------------------------------------------
# 检查某个软件包是否已安装
_isInstalled() {
    package="$1"
    check="$(sudo pacman -Qs --color always "${package}" | grep "local" | grep "${package} ")"
    if [ -n "${check}" ]; then
        echo 0 #'0' 表示已安装
        return
    fi
    echo 1 #'1' 表示未安装
    return
}

# 安装软件包
_installed() {
    package="$1"
    if sudo pacman -S --noconfirm "$package"; then
        return 0 # 安装成功返回0
    else
        return 1 # 安装失败返回1
    fi
}


# 检查某个命令是否存在
_checkCommandExists() {
    package="$1"
    if ! command -v $package >/dev/null; then
        return 1
    else
        return 0
    fi
}

# 安装所需的包
_installPackages() {
    toInstall=()
    for pkg; do
        if [[ $(_isInstalled "${pkg}") == 0 ]]; then
            echo -e "${PINK}::${NONE} ${GREEN}${ITALIC}${pkg}${NONE} 已经安装过了."
            continue
        fi
        toInstall+=("${pkg}")
    done
    if [[ "${toInstall[@]}" == "" ]]; then
        return
    fi
    echo
    echo -e "${BLUE}::${NONE} ${BLUE}即将安装未安装的软件包${NONE}"
    failed_packages=()
    for pkg in "${toInstall[@]}"; do
        echo -e "正在安装 ${GREEN}${pkg}${NONE}..."
        if sudo pacman --noconfirm -S "${pkg}"; then
            echo -e "${PINK}::${NONE} ${GREEN}${BOLD}${pkg}${NONE} 安装成功"
        else
            echo -e "${PINK}::${NONE} ${RED}${BOLD}${pkg}${NONE} 安装失败"
            failed_packages+=("$pkg")
        fi
    done
    if [ ${#failed_packages[@]} -ne 0 ]; then
        echo -e "\n${RED}以下包安装失败:${NONE}"
        printf "%s\n" "${failed_packages[@]}"
    fi
}

# 安装 yay（如果未安装）
_installYay() {
    _installPackages "base-devel"
    SCRIPT=$(realpath "$0")
    temp_path=$(dirname "$SCRIPT")
    git clone https://aur.archlinux.org/yay.git $download_folder/yay
    cd $download_folder/yay
    makepkg -si
    cd $temp_path
    echo -e "${PINK}::${NONE} ${GREEN}yay${NONE} 安装成功. "
}

# -----------------------------------------------
# 包定义
# -----------------------------------------------

# 必要的包
packages=(
    "git"
)

# 读取外部 `packages.txt` 文件
_external_packages=()
if [[ -f "packages.txt" ]]; then
    while IFS= read -r line; do
        # 跳过空行和注释行
        [[ -z "$line" || "$line" =~ ^[[:space:]]*# ]] && continue
        _external_packages+=("$line")
    done < packages.txt
else
    echo -e "${PINK}::${NONE} ${RED}没有找到 packages.txt${NONE}"
fi

#------------------------------------------------
# 开始安装软件包
# -----------------------------------------------

# 同步包数据库
sudo pacman -Sy

# 安装gum
if [[ $(_isInstalled "gum") == 0 ]]; then
    echo ":: gum 已经安装过了."
else
    if sudo pacman -S gum --noconfirm; then
        echo ":: gum 安装成功"
    else
        echo ":: gum 安装失败"
        exit 1
    fi
fi

clear

# 欢迎
gum style \
	--foreground 212 --border-foreground 212 --border double \
	--align center --width 50 --margin "1 2" --padding "2 4" \
	'Arch Linux 软件安装和Dotfiles配置' '欢迎使用!'

# 提示用户是否开始安装
if gum confirm "你现在想开始安装吗?"; then
    echo ":: 安装开始."
    echo
else
    echo ":: 安装已取消"
    exit
fi


# 检查并安装所需的软件包
echo -e "${PURPLE}::${NONE} ${BLUE}检查并安装所需软件包...${NONE}"
_installPackages "${packages[@]}"

# 等待
gum spin --spinner dot --title "安装必备软件包..." -- sleep 3


# 如果需要则安装 yay
if _checkCommandExists "yay"; then
    echo -e "${PINK}::${NONE} ${GREEN}yay${NONE} 已经安装"
else
    echo -e "${PINK}::${NONE} ${YELLOW}安装程序需要 yay. 现在将安装 yay.${NONE}"
    _installYay
fi
echo

# 安装外部包
echo -e "${PURPLE}::${NONE} ${BLUE}安装外部软件包...${NONE}"
_installPackages "${_external_packages[@]}"

# -----------------------------------------------
# 开始配置dotfiles
# -----------------------------------------------

# 显示安装成功的消息
gum style --foreground 212 --border-foreground 212 --border double \
    --align center --width 50 --margin "1 2" --padding "2 4" \
    '安装完成!' '感谢使用本脚本!'

# 启动进度指示器
gum spin --spinner dot --title "正在配置系统..." -- sleep 3
echo -e "${PURPLE}::${NONE} ${BLUE}系统配置完成!${NONE}"
