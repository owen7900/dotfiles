if status is-interactive
# set --universal tide_left_prompt_items distrobox $tide_left_prompt_items
if test (lsb_release -sc) = "jammy"; 
echo JAMMY
export XDG_DATA_HOME="$HOME/.local/share20" 
export XDG_DATA_DIRS=/usr/share/regolith:/usr/share/gnome:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop:$HOME/.local/share20
else if test (lsb_release -sc) = "bionic";
export XDG_DATA_HOME="$HOME/.local/share18" 
export XDG_DATA_DIRS=/usr/share/regolith:/usr/share/gnome:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop:$HOME/.local/share18
else  
export ROS_DOMAIN_ID=42
alias ls="eza --icons=always --hyperlink"
end 
fish_add_path -a --path $HOME/appimages
register-python-argcomplete --shell fish pipx | source
register-python-argcomplete --shell fish ros2 | source


set fish_greeting You have $(math $(ps aux | grep /usr/bin/fish | wc -l) - 1) shells open

alias roscd="ccd"

alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

theme_tokyonight night

fish_add_path /usr/lib/ccache/bin/
fish_add_path $HOME/bin
alias vi nvim
alias ssh="kitty +kitten ssh"
function r 
    cd $HOME/Repos/$argv
end
complete -c r -f -a "(/usr/bin/ls $HOME/Repos)"
    # Commands to run in interactive sessions can go here
end
