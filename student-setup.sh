#!/bin/bash
# ==========================================
# Student Linux Setup Script for Mint
# Created by Omar Morales
# ==========================================

echo "🔄 Updating system packages..."
sudo apt update && sudo apt upgrade -y

echo "🧰 Installing Productivity Tools..."
sudo apt install -y libreoffice pdfarranger pluma speedcrunch

echo "💻 Installing Coding Tools..."
sudo apt install -y python3 python3-pip thonny geany git
# VS Code (via Microsoft repo)
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install -y code
rm -f packages.microsoft.gpg

echo "🎨 Installing Creativity Tools..."
sudo apt install -y krita audacity shotcut tuxpaint gimp

echo "📚 Installing Educational Tools..."
sudo apt install -y gcompris scratch

echo "🌐 Installing Web Tools..."
sudo apt install -y firefox chromium-browser

echo "🧹 Installing System Utilities..."
sudo apt install -y timeshift bleachbit synaptic

echo "✅ Setup Complete! Ready for Students."
