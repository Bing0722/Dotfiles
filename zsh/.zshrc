# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Oh-my-zsh installation path
ZSH=/usr/share/oh-my-zsh/

# Powerlevel10k theme path
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# List of plugins used
plugins=( git sudo zsh-256color zsh-autosuggestions zsh-syntax-highlighting )
source $ZSH/oh-my-zsh.sh


# Helpful aliases
alias cl='clear' # clear terminal
alias l='eza -lh --icons=auto' # long list
alias ls='eza -1 --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree
alias un='$aurhelper -Rns' # uninstall package
alias up='$aurhelper -Syu' # update system/package/aur
alias pl='$aurhelper -Qs' # list installed package
alias pa='$aurhelper -Ss' # list available package
alias pc='$aurhelper -Sc' # remove unused cache
alias po='$aurhelper -Qtdq | $aurhelper -Rns -' # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -
alias vc='code' # gui code editor
alias memcheck="valgrind --leak-check=full --show-reachable=yes --track-origins=yes"

# Directory navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
alias mkdir='mkdir -p'
alias vim=nvim

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# set environment variable
export EDITOR=nvim
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$HOME/.local/bin:$PATH
export GOPROXY=https://goproxy.cn,direct
export PATH="$HOME/App/vcpkg:$PATH"

# zoxide init
eval "$(zoxide init zsh)"

# -----------------------------------------------
# Set proxy
# refer to https://wiki.archlinux.org/title/Proxy_server
# -----------------------------------------------

proxy="127.0.0.1:7897"  # 使用全局变量

proxy_on() {
    if (( $# > 0 )); then
        # 获取 "ip:port" 格式
        valid=$(echo "$1" | sed -E 's/([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}):([0-9]+)/\1:\2/')
        if [[ "$valid" != "$1" ]]; then
            echo "Invalid address" >&2
            return 1
        fi
        proxy="$1"
    fi

    export http_proxy="$proxy"
    export https_proxy="$proxy"
    export HTTP_PROXY="$proxy"
    export HTTPS_PROXY="$proxy"
    export ftp_proxy="$proxy"
    export FTP_PROXY="$proxy"
    export rsync_proxy="$proxy"
    export RSYNC_PROXY="$proxy"
    echo "Proxy environment variable set."
    echo "Note that sudo will not use proxy"
    echo "proxy=$proxy"
}

proxy_off() {
    unset http_proxy https_proxy ftp_proxy rsync_proxy
    unset HTTP_PROXY HTTPS_PROXY FTP_PROXY RSYNC_PROXY
    echo "Proxy environment variable removed."
}

proxy_status() {
    if [[ -z "$http_proxy" && -z "$https_proxy" ]]; then
        echo "No Proxy environment."
    else
        echo "Have Proxy environment."
    fi
    echo "http_proxy: $http_proxy"
    echo "HTTP_PROXY: $HTTP_PROXY"
    echo "https_proxy: $https_proxy"
    echo "HTTPS_PROXY: $HTTPS_PROXY"
    echo "ftp_proxy: $ftp_proxy"
    echo "FTP_PROXY: $FTP_PROXY"
    echo "rsync_proxy: $rsync_proxy"
    echo "RSYNC_PROXY: $RSYNC_PROXY"
}

