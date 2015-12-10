#!/bin/bash

DOT_FILES_DIR="$( cd "$( dirname "$0" )" && pwd )"
cd $HOME

echo "Make links between $DOT_FILES_DIR and $HOME"
rm -f .gitconfig && ln -sf "$DOT_FILES_DIR/gitconfig" .gitconfig
rm -rf .vim && ln -sf "$DOT_FILES_DIR/vim" .vim
rm -f .vimrc && ln -sf "$DOT_FILES_DIR/vimrc" .vimrc

echo "Install VIM plugins"
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall! +qall &>/dev/null
