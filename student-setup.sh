#!/bin/bash
# ==========================================
# Student Linux Setup Script for Mint
# Includes lockdown for non-admin students
# Created by Omar Morales
# ==========================================

set -euo pipefail

echo "🔄 Updating system packages..."
sudo apt update && sudo apt upgrade -y

echo "🧰 Installing Productivity Tools..."
sudo apt install -y libreoffice pdfarranger pluma speedcrunch

echo "💻 Installing Coding Tools..."
sudo apt install -y python3 python3-pip thonny geany git
# VS Code installation
wget -qO vscode.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
sudo apt install -y ./vscode.deb
rm -f vscode.deb

echo "🎨 Installing Creativity Tools..."
sudo apt install -y krita audacity shotcut tuxpaint gimp

echo "📚 Installing Educational Tools..."
sudo apt install -y scratch

echo "🌐 Installing Web Tools..."
sudo apt install -y firefox chromium-browser

echo "🧹 Installing System Utilities..."
sudo apt install -y timeshift bleachbit synaptic

echo "✅ App installation complete!"

# ------------------------------------------
# LOCKDOWN BLOCK: Prevent students from installing packages
# ------------------------------------------

echo "🔒 Applying student lockdown..."

STUDENT_USER="student"
STUDENT_PASS="student"  # Optional: change or remove password for real deployment

# Create student account if it doesn't exist
if id -u "$STUDENT_USER" >/dev/null 2>&1; then
    echo "Student account '$STUDENT_USER' already exists, skipping creation."
else
    sudo useradd -m -s /bin/bash "$STUDENT_USER"
    echo "$STUDENT_USER:$STUDENT_PASS" | sudo chpasswd
    echo "Student account '$STUDENT_USER' created."
fi

# Remove sudo privileges
sudo deluser "$STUDENT_USER" sudo || true
sudo deluser "$STUDENT_USER" adm || true
sudo deluser "$STUDENT_USER" admin || true

# Remove GUI installers and optional package systems
sudo apt remove --purge -y gdebi-core gdebi mintinstall flatpak snapd || true
sudo apt autoremove -y

# Disable PackageKit actions for non-admins (polkit)
POLKIT_RULE=/etc/polkit-1/localauthority/50-local.d/50-disable-packagekit.pkla
sudo tee "$POLKIT_RULE" >/dev/null <<'PKRULE'
[Disable PackageKit for non-admins]
Identity=unix-user:*
Action=org.freedesktop.packagekit.*
ResultActive=no
PKRULE
sudo chmod 644 "$POLKIT_RULE"

# Restrict apt/dpkg to root only (belt-and-suspenders)
sudo chmod 750 /usr/bin/apt || true
sudo chmod 750 /usr/bin/apt-get || true
sudo chmod 750 /usr/bin/dpkg || true

echo "🔒 Student lockdown applied successfully!"
echo "Student account '$STUDENT_USER' cannot install packages or run GUI installers."
echo "You can log in as '$STUDENT_USER' to test the restrictions."
