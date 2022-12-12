#!/bin/bash

DOT_FILES_DIR="$( cd "$( dirname "$0" )" && pwd )"

echo ">> Make links between $DOT_FILES_DIR and $HOME"
rm -f ~/.hushlogin && ln -sf "$DOT_FILES_DIR/hushlogin" ~/.hushlogin
rm -f ~/.gitconfig && ln -sf "$DOT_FILES_DIR/gitconfig" ~/.gitconfig

rm -rf ~/.vim && ln -sf "$DOT_FILES_DIR/vim" ~/.vim
rm -f ~/.vimrc && ln -sf "$DOT_FILES_DIR/vimrc" ~/.vimrc

rm -f ~/.bashrc && ln -sf "$DOT_FILES_DIR/bash/bashrc" ~/.bashrc
rm -f ~/.bash_aliases && ln -sf "$DOT_FILES_DIR/bash/bash_aliases" ~/.bash_aliases
rm -f ~/.bash_exports && ln -sf "$DOT_FILES_DIR/bash/bash_exports" ~/.bash_exports
rm -f ~/.bash_logout && ln -sf "$DOT_FILES_DIR/bash/bash_logout" ~/.bash_logout
rm -f ~/.bash_options && ln -sf "$DOT_FILES_DIR/bash/bash_options" ~/.bash_options
rm -f ~/.bash_profile && ln -sf "$DOT_FILES_DIR/bash/bash_profile" ~/.bash_profile
rm -f ~/.bash_prompt && ln -sf "$DOT_FILES_DIR/bash/bash_prompt" ~/.bash_prompt
rm -f ~/.bash_functions && ln -sf "$DOT_FILES_DIR/bash/bash_functions" ~/.bash_functions

mkdir -p ~/.config/Code/User
rm -f ~/.config/Code/User/settings.json && ln -sf "$DOT_FILES_DIR/vscode/settings.json" ~/.config/Code/User/settings.json
rm -f ~/.config/Code/User/locale.json && ln -sf "$DOT_FILES_DIR/vscode/locale.json" ~/.config/Code/User/locale.json
rm -f ~/.config/Code/User/vsicons.settings.json && ln -sf "$DOT_FILES_DIR/vscode/vsicons.settings.json" ~/.config/Code/User/vsicons.settings.json
rm -f ~/.config/Code/User/keybindings.json && ln -sf "$DOT_FILES_DIR/vscode/keybindings.json" ~/.config/Code/User/keybindings.json

mkdir -p ~/.config
rm -f ~/.config/starship.toml && ln -sf "$DOT_FILES_DIR/config/starship.toml" ~/.config/starship.toml

mkdir -p ~/.config/neofetch
rm -f ~/.config/neofetch/config.conf && ln -sf "$DOT_FILES_DIR/config/neofetch/config.conf" ~/.config/neofetch/config.conf

echo ">> Install/Upgrade vim-plug"
if [ ! -f $DOT_FILES_DIR/vim/autoload/plug.vim ]; then
    curl -fLo $DOT_FILES_DIR/vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
    vim +PlugUpgrade +qall &>/dev/null
fi

echo ">> Remove unused VIM plugins"
vim +PlugClean! +qall! &>/dev/null

echo ">> Install/Update VIM plugins"
vim +PlugUpdate +qall! &>/dev/null

cd $OLDPWD
