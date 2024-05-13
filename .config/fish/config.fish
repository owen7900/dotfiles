if status is-interactive
# set --universal tide_left_prompt_items distrobox $tide_left_prompt_items
if test (lsb_release -sc) = "bionic";
export XDG_DATA_HOME="$HOME/.local/share18" 
export XDG_DATA_DIRS=/usr/share/regolith:/usr/share/gnome:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop:$HOME/.local/share18
else  
export ROS_DOMAIN_ID=42
alias ls="exa --icons"
end 
fish_add_path -a --path $HOME/appimages
export DEBUGINFOD_URLS="https://debuginfod.ubuntu.com/"
export DEBUGINFOD_PROGRESS=1

bass source /opt/ros/humble/setup.bash
$HOME/globalVenv/bin/register-python-argcomplete -s fish ros2 | source
$HOME/globalVenv/bin/register-python-argcomplete -s fish colcon | source

set fish_greeting You have $(math $(ps aux | grep /usr/bin/fish | wc -l) - 1) shells open

alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
# export MANPAGER='nvim +Man!'

theme_tokyonight night

fish_add_path /usr/lib/ccache/bin/
fish_add_path $HOME/bin
fish_add_path $HOME/go/bin
fish_add_path /home/owen/.cargo/bin
alias vi=nvim
alias apt=nala
alias ssh="kitty +kitten ssh"
source $HOME/.config/fish/repos.fish
    # Commands to run in interactive sessions can go here
end
