#!/bin/bash
# ==========================================
# Student Linux Mint Setup Script
# Created by Omar Morales
# ==========================================

echo "🔄 Updating system packages..."
sudo apt update && sudo apt upgrade -y

echo "🧰 Installing Productivity Tools..."
sudo apt install -y libreoffice pdfarranger pluma speedcrunch

echo "💻 Installing Coding / STEM Tools..."
sudo apt install -y python3 python3-pip thonny geany git scratch 

echo "🌐 Installing Web & Research Tools..."
sudo apt install -y firefox 

echo "🎨 Installing Creativity Tools..."
sudo apt install -y krita tuxpaint audacity shotcut gimp

echo "🧩 Installing System Utilities..."
sudo apt install -y timeshift bleachbit synaptic

echo "✅ All selected tools installed successfully!"
echo "🎓 Your Linux Mint for Students setup is ready."
