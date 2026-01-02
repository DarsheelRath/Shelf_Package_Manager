import tarfile
import os
import shutil
import sys

TARGET_BASE = "/opt/shelf"

def install_trophy(file_path):
    if not file_path.endswith(".trophy.tar.gz"):
        print("🗒️ SHELF INSTALLER Error: Not a valid .trophy.tar.gz file.")
        return

    # Extract app name: mypackage.trophy.tar.gz -> mypackage
    package_name = os.path.basename(file_path).split(".")[0]
    install_destination = os.path.join(TARGET_BASE, package_name)

    print(f"🏆 Pouring Trophy: {package_name} into {install_destination}...")

    if not os.path.exists(install_destination):
        os.makedirs(install_destination, exist_ok=True)

    with tarfile.open(file_path, "r:gz") as archive:
        archive.extractall(path=install_destination)
    
    print(f"☑️ Successfully installed to {install_destination}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python3 shelf_installer.py <path_to_trophy>")
    else:
        install_trophy(sys.argv[1])
