if status is-interactive
test -e /etc/profile.d/distrobox_profile.sh && test -e /run/.containerenv && export XDG_DATA_HOME="/home/owen/.local/share18" && export XDG_DATA_DIRS=/usr/share/regolith:/usr/share/gnome:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop:/home/owen/.local/share18

theme_tokyonight night
alias vi nvim

set fish_greeting You have $(math $(ps aux | grep /usr/bin/fish | wc -l) - 1) shells open
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

alias roscd="ccd"

fish_add_path -p $HOME/bin 
fish_add_path -p $HOME/.cargo/bin
    # Commands to run in interactive sessions can go here
end

