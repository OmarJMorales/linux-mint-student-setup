#!/bin/bash
# ==========================================
# Linux Mint Student Setup Script
# Author: Omar Morales
# ==========================================

echo "✅ Updating System"
sudo apt update && sudo apt upgrade -y

echo "🧰 Installing Productivity Apps"
sudo apt install -y libreoffice pdfarranger xed speedcrunch

echo "💻 Installing Coding Tools"
sudo apt install -y python3 python3-pip thonny geany git

echo "🎨 Installing Creativity Tools"
sudo apt install -y krita audacity shotcut tuxpaint gimp

echo "📚 Installing Educational Apps"
sudo apt install -y gcompris-qt scratch || sudo apt install -y scratch-editor

echo "🛠️ Installing System Utilities"
sudo apt install -y timeshift bleachbit synaptic wget curl

echo "📦 Downloading & Installing VS Code"
wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -O vscode.deb \
 && sudo apt install -y ./vscode.deb \
 && rm vscode.deb

echo "✨ Setup Complete — Student System Ready!"
