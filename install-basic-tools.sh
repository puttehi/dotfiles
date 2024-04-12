#!/bin/bash

echo ""
echo "Installing basic stuff... There are newer versions available outside of apt"
echo ""
echo "Check for prompts!"
echo ""

sudo apt update
sudo apt install git python3 python3-venv curl wget ripgrep fd-find bat fzf tldr tree zoxide lolcat gcc clang golang make unzip git-delta terminator

echo ""
echo "Oh My Posh (requires wget)"
echo ""

~/install-oh-my-posh.sh

echo ""
echo "Node Version Manager"
echo ""

~/install-nvm-v0.39.7.sh

