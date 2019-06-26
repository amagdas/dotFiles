dotFiles
========

Linux dot files
```
mkdir Work && cd Work
git clone https://github.com/amagdas/dotFiles
cd dotFiles
git submodule init
git submodule sync
```

#Vim config
```
cd ~
ln -s Work/dotFiles/.vim
ln -s Work/dotFiles/.vimrc
:VundleInstall
```

#Emacs config
`git clone https://github.com/amagdas/dot_emacs`

`sudo apt-get install emacs2.5`

`ln -s Work/dot_emacs ~/.emacs.d`

`$ curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python`

`cd ~/.emacs.d/ && cask install`

## Nodejs and eslint support
`sudo npm install -g eslint babel-eslint eslint-plugin-react eslint-config-airbnb`

# Gnome-terminal
`mkdir bin_utils && cd bin_utils`

`ln -s Work/dotFiles/gnome-terminal-cursor-shape.sh .`

#Zsh
Install zsh and ohmyzsh.
`cd ~ && ln -s Work/dotFiles/zshrc_mint .zshrc`