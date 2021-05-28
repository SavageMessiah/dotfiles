#!/usr/bin/env bash
dot=~/.dotfiles
cd ~
mkdir -p .config

for f in $dot/config/*
do
    name=`basename $f`
    if [ -e .config/$name ]
    then
        echo $f exists
    else
        ln -s $f .config/$name
    fi
done

if [ ! -e $dot/vim/swap ]
then
    mkdir $dot/vim/swap
fi
if [ ! -e $dot/vim/backup ]
then
    mkdir $dot/vim/backup
fi
if [ ! -e $dot/vim/undo ]
then
    mkdir $dot/vim/undo
fi
ln -s $dot/vim .vim
ln -s $dot/vimrc .vimrc
ln -s $dot/tmux.conf .tmux.conf
ln -s $dot/doom .doom.d

ln -s $dot/config/kak-lsp ~/Library/Preferences/kak-lsp

