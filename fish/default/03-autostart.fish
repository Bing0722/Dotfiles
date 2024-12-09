# -----------------------------------------------
# Fastfetch
# -----------------------------------------------

# 检查是否在虚拟终端中（如 pts）
if test (tty | string match -r '.*pts.*')
    fastfetch --config examples/13
else
    echo ""
    # 检查是否安装了 Qtile
    if test -f /bin/qtile
        echo "Start Qtile X11 with command Qtile"
    end
    # 检查是否安装了 Hyprland
    if test -f /bin/hyprctl
        echo "Start Hyprland with command Hyprland"
    end
end
