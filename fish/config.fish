#  _____   ___   ____    _   _ 
# |  ___| |_ _| / ___|  | | | |
# | |_     | |  \___ \  | |_| |
# |  _|    | |   ___) | |  _  |
# |_|     |___| |____/  |_| |_|
# -----------------------------------------------

# -----------------------------------------------
# General Settings
# -----------------------------------------------
set -g fish_greeting # disable greeting

if status is-interactive
    # Commands to run in interactive sessions can go here

    # -------------------------------------------
    # starship
    # -------------------------------------------
    starship init fish | source

    # -------------------------------------------
    # Load default configuration
    # -------------------------------------------
    for f in $HOME/.config/fish/default/*.fish
        if test -f $f
            source $f
        end
    end

    # -------------------------------------------
    # Load costom configuration
    # -------------------------------------------
    if test -f $HOME/.config/fish/custom/config.fish
        source $HOME/.config/fish/custom/config.fish
    end

    # -------------------------------------------
    # Change the working directory
    # -------------------------------------------
    cd ~/MyFile/
end

# -----------------------------------------------
# Load environment variable
# -----------------------------------------------
if [ -f $HOME/.config/fish/init ]
    source $HOME/.config/fish/init
end
