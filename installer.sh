#!/bin/bash

# --- Configuration ---
INSTALL_DIR="/opt/shelf"
BIN_LINK="/usr/local/bin/shelf"
REPO_RAW_URL="https://raw.githubusercontent.com/DarsheelRath/Shelf_Package_Manager/main"
FILES=("shelf" "shelf_installer.py")

echo "🏆 Installing Shelf Package Manager..."

# 1. Create the directory
sudo mkdir -p "$INSTALL_DIR"

# 2. Download files directly to /opt/shelf
for file in "${FILES[@]}"; do
    echo "   [+] Downloading $file..."
    sudo curl -sL "$REPO_RAW_URL/$file" -o "$INSTALL_DIR/$file"
done

# 3. Set Permissions
sudo chmod +x "$INSTALL_DIR/shelf"
# Ensure the folder is owned by you so you can install trophies without sudo later
sudo chown -R $USER "$INSTALL_DIR"
echo "   [+] Permissions set (Owned by $USER)"

# 4. Create Global Symbolic Link
sudo rm -f "$BIN_LINK"
sudo ln -s "$INSTALL_DIR/shelf" "$BIN_LINK"
echo "   [+] Symbolic link created at $BIN_LINK"

echo "✅ Shelf installation complete! Restart your terminal and type 'shelf'."
