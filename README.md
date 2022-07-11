This dotfile management is based of off [this post]: https://news.ycombinator.com/item?id=11071754

#Setup:
```
    git init --bare $HOME/.myconf
    alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
    config config status.showUntrackedFiles no
```

#Usage
```
    config status
    config add .vimrc
    config commit -m "Add vimrc"
    config add .config/redshift.conf
    config commit -m "Add redshift config"
    config push
```

#Cloning 
```
   git clone --separate-git-dir=$HOME/.myconf /path/to/repo $HOME/myconf-tmp
   cp ~/myconf-tmp/.gitmodules ~  # If you use Git submodules
   rm -r ~/myconf-tmp/
   alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
```

#Install
```
chmod +x .config/setup.sh && $HOME/.config/setup.sh
```
