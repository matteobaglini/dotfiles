#!/bin/bash

DOT_FILES_DIR="$( cd "$( dirname "$0" )" && pwd )"
cd $HOME

rm -f .gitconfig && ln -sf "$DOT_FILES_DIR/gitconfig" .gitconfig
rm -rf .vim && ln -sf "$DOT_FILES_DIR/vim" .vim
rm -f .vimrc && ln -sf "$DOT_FILES_DIR/vimrc" .vimrc

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo "Install VIM plugins"
vim +PluginInstall! +qall &>/dev/null
