# -----------------------------------------------
# Sete proxy
# refer to https://wiki.archlinux.org/title/Proxy_server
# -----------------------------------------------
set -g proxy "127.0.0.1:7890" # 使用全局变量

function proxy_on
    if test (count $argv) -gt 0
        # 获取 "ip:port" 格式
        set valid (echo $argv | sed -E 's/([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}):([0-9]+)/\1:\2/')
        if test $valid != $argv
            echo "Invalid address" >&2
            return 1
        end
        set proxy $argv[1]
    end

    set -gx http_proxy $proxy
    set -gx https_proxy $proxy
    set -gx HTTP_PROXY $proxy
    set -gx HTTPS_PROXY $proxy
    set -gx ftp_proxy $proxy
    set -gx FTP_PROXY $proxy
    set -gx rsync_proxy $proxy
    set -gx RSYNC_PROXY $proxy
    echo "Proxy environment variable set."
    echo "Note that sudo will not use proxy"
    echo "proxy=$proxy"
end

function proxy_off
    set -e http_proxy https_proxy ftp_proxy rsync_proxy
    set -e HTTP_PROXY HTTPS_PROXY FTP_PROXY RSYNC_PROXY
    echo "Proxy environment variable removed."
end

function proxy_status
    if test -z $http_proxy; and test -z $https_proxy
        echo "No Proxy environment."
    else
        echo "Have Proxy environment."
    end
    echo "http_proxy: $http_proxy"
    echo "HTTP_PROXY: $HTTP_PROXY"
    echo "https_proxy: $https_proxy"
    echo "HTTPS_PROXY: $HTTPS_PROXY"
    echo "ftp_proxy: $ftp_proxy"
    echo "FTP_PROXY: $FTP_PROXY"
    echo "rsync_proxy: $rsync_proxy"
    echo "RSYNC_PROXY: $RSYNC_PROXY"
end
