#!/bin/bash

DOT_FILES_DIR="$( cd "$( dirname "$0" )" && pwd )"

echo "Make links between $DOT_FILES_DIR and $HOME"
rm -f ~/.hushlogin && ln -sf "$DOT_FILES_DIR/hushlogin" ~/.hushlogin
rm -f ~/.gitconfig && ln -sf "$DOT_FILES_DIR/gitconfig" ~/.gitconfig
rm -rf ~/.vim && ln -sf "$DOT_FILES_DIR/vim" ~/.vim
rm -f ~/.vimrc && ln -sf "$DOT_FILES_DIR/vimrc" ~/.vimrc

echo "Install vim-plug and other plugins"
if [ ! -f $DOT_FILES_DIR/vim/autoload/plug.vim ]; then
    curl -fLo $DOT_FILES_DIR/vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
    vim +PlugUpgrade +qall &>/dev/null
fi
vim +PlugClean! +qall &>/dev/null
vim +PlugUpdate +qall &>/dev/null

echo "Install powerline fonts"
if [ ! -d ~/powerline-fonts ]; then
    git clone --recursive --depth 1 \
        https://github.com/powerline/fonts/ \
        ~/powerline-fonts
    cd ~/powerline-fonts
else
    cd ~/powerline-fonts
    git pull
fi
./install.sh &>/dev/null
cd $OLDPWD

echo "Install awesome terminal fonts"
if [ ! -d ~/awesome-fonts ]; then
    git clone --recursive --depth 1 \
        https://github.com/gabrielelana/awesome-terminal-fonts/ \
        ~/awesome-fonts
    cd ~/awesome-fonts
else
    cd ~/awesome-fonts
    git pull
fi
./install.sh &>/dev/null
cd $OLDPWD

if [ -n "$DISPLAY" ]; then
    echo "Configure Gnome Terminal profile"
    dconf reset -f "/org/gnome/terminal/"
    cat gnome-terminal.ini | dconf load "/org/gnome/terminal/"
fi
