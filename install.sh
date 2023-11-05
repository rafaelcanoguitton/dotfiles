#!/bin/bash


rm -rf ~/.config/nvim/lua/custom/
ln -s $(readlink -f ./nvchad/custom) ~/.config/nvim/lua/
ln -s $(readlink -f ./alacritty/alacritty.yml) ~/.config/alacritty/alacritty.yml
ln -s $(readlink -f ./alacritty/themes) ~/.config/alacritty/themes
