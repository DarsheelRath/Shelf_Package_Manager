#!/bin/bash

# --- Configuration ---
INSTALL_DIR="/opt/shelf"
BIN_LINK="/usr/local/bin/shelf"
# This points directly to your repository's raw files
REPO_URL="https://raw.githubusercontent.com/DarsheelRath/Shelf_Package_Manager/main"
FILES=("shelf" "shelf_installer.py")

echo "🏆 Installing Shelf Package Manager..."

# 1. Create the directory
sudo mkdir -p "$INSTALL_DIR"

# 2. Download the logic files from GitHub into /opt/shelf
for file in "${FILES[@]}"; do
    echo "   [+] Downloading $file..."
    sudo curl -sL "$REPO_URL/$file" -o "$INSTALL_DIR/$file"
done

# 3. Set Permissions
sudo chmod +x "$INSTALL_DIR/shelf"
# Take ownership so you can manage your trophies
sudo chown -R $USER "$INSTALL_DIR"
echo "   [+] Permissions set (Owned by $USER)"

# 4. Create Global Symbolic Link
sudo rm -f "$BIN_LINK"
sudo ln -s "$INSTALL_DIR/shelf" "$BIN_LINK"
echo "   [+] Symbolic link created at $BIN_LINK"

echo "✅ Shelf installation complete! Open a NEW terminal and type 'shelf'."
