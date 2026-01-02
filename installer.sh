#!/bin/bash

# --- Configuration ---
INSTALL_DIR="/opt/shelf"
BIN_LINK="/usr/local/bin/shelf"
SOURCE_FILES=("shelf" "shelf_installer.py")

echo "🏆 Installing Shelf Package Manager..."

# 1. Create the directory
sudo mkdir -p "$INSTALL_DIR"

# 2. Copy the logic files
# We assume you are running this from your repo folder
for file in "${SOURCE_FILES[@]}"; do
    if [ -f "$file" ]; then
        sudo cp "$file" "$INSTALL_DIR/"
        echo "   [+] Copied $file"
    else
        echo "   [!] Warning: $file not found in current directory."
    fi
done

# 3. Set Permissions
sudo chmod +x "$INSTALL_DIR/shelf"
sudo chown -R $USER "$INSTALL_DIR"
echo "   [+] Permissions set (Owned by $USER)"

# 4. Create Global Symbolic Link
if [ -L "$BIN_LINK" ]; then
    sudo rm "$BIN_LINK"
fi
sudo ln -s "$INSTALL_DIR/shelf" "$BIN_LINK"
echo "   [+] Symbolic link created at $BIN_LINK"

echo "✅ Shelf installation complete! Try typing 'shelf' in a new terminal."
