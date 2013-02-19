#!/usr/bin/env sh

DIR=`pwd`

echo 'git setting'
ln -s ${DIR}/git/dot.gitconfig ~/.gitconfig
ln -s ${DIR}/git/dot.gitignore ~/.gitignore

echo 'zsh setting'
ln -s ${DIR}/zsh/dot.zshrc ~/.zshrc

echo 'vim setting'
ln -s ${DIR}/vim ~/.vim
ln -s ~/.vim/dot.vimrc ~/.vimrc

echo 'tmux'
ln -s ${DIR}/tmux/dot.tmux.conf ~/.tmux.conf
ln -s ${DIR}/tmux/bundle ~/.tmux-bundle
ln -s ${DIR}/tmux/dot.tmux-powerlinerc ~/.tmux-powerlinerc
