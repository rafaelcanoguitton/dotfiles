#!/bin/bash


rm -rf ~/.config/nvim/lua/custom/
ln -s $(readlink -f ./nvchad/custom) ~/.config/nvim/lua/
