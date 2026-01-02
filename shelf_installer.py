import sys
import os
import tarfile

TARGET_BASE = "/opt/shelf"

def run_install(package_name):
    # For this example, we assume the trophy is in a temp folder 
    # or you add code here to download it from GitHub
    trophy_file = f"{package_name}.trophy.tar.gz"
    
    if not os.path.exists(trophy_file):
        print(f"❌ Error: {trophy_file} not found in current directory.")
        return

    install_path = os.path.join(TARGET_BASE, package_name)
    os.makedirs(install_path, exist_ok=True)

    print(f"🏆 Installing {package_name} into {install_path}...")
    
    with tarfile.open(trophy_file, "r:gz") as archive:
        archive.extractall(path=install_path)
    
    print(f"✅ Done! '{package_name}' is now on the Shelf.")

if __name__ == "__main__":
    # The shell script passes the package name as the first argument
    pkg = sys.argv[1]
    run_install(pkg)
