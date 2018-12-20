#!/bin/bash

DOT_FILES_DIR="$( cd "$( dirname "$0" )" && pwd )"

echo "Make links between $DOT_FILES_DIR and $HOME"
rm -f ~/.hushlogin && ln -sf "$DOT_FILES_DIR/hushlogin" ~/.hushlogin
rm -f ~/.gitconfig && ln -sf "$DOT_FILES_DIR/gitconfig" ~/.gitconfig
rm -rf ~/.vim && ln -sf "$DOT_FILES_DIR/vim" ~/.vim
rm -f ~/.vimrc && ln -sf "$DOT_FILES_DIR/vimrc" ~/.vimrc
rm -f ~/.config/Code/User/settings.json && ln -sf "$DOT_FILES_DIR/vscode/settings.json" ~/.config/Code/User/settings.json
rm -f ~/.config/Code/User/locale.json && ln -sf "$DOT_FILES_DIR/vscode/locale.json" ~/.config/Code/User/locale.json
rm -f ~/.config/Code/User/vsicons.settings.json && ln -sf "$DOT_FILES_DIR/vscode/vsicons.settings.json" ~/.config/Code/User/vsicons.settings.json
rm -f ~/.config/Code/User/keybindings.json && ln -sf "$DOT_FILES_DIR/vscode/keybindings.json" ~/.config/Code/User/keybindings.json