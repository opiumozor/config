#!/bin/sh

## install zsh config
echo "> Linking new zshrc config"
ln -s ~/.config/zsh/dot.zshrc ~/.zshrc
echo "> Installing zsh theme"
cd ~/.oh-my-zsh/themes/
wget https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme

## install screen config
echo "> Linking new screen config"
ln -s ~/.config/screen/dot.screenrc ~/.screenrc

## install emacs config
echo "> Linking new emacs config"
ln -s ~/.config/emacs/dot.emacs ~/.emacs
