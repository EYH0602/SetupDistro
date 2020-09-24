
import os

# basic setup
os.system("sudo apt update && sudo apt upgrade")
os.system("sudo apt install curl python htop wget")   # 'python' here is for python2, which is no longer included 

# git
os.system("sudo apt install git")
os.system("mv ./gitconfig ~/.gitconfig")
os.system("mv ./git-credentials ~/.git-credentials")

# zsh
# os.system("sh ./get-zsh.sh")

# neofetch
os.system("sudo apt install neofetch")
os.system("mv ./config.conf ${HOME}/.config/neofetch/config.conf")

# vim
os.system("bash setup-vim.sh")

# Web
os.system("sudo apt install chromium-browser")

# visual studio code
# os.system("bash get-vscode.sh")

# Typora (Open-source Markdown editor)
os.system("wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -")
os.system("sudo add-apt-repository 'deb https://typora.io/linux ./'")
os.system("sudo apt install typora")

# WeChat and QQ (wine)
# os.system("wget -O- https://deepin-wine.i-m.dev/setup.sh | sh")
# os.system("sudo apt install deepin.com.wechat")
# os.system("sudo apt install deepin.com.qq.im")

# OneDrive
wantOneDrive = input("Want OneDrive? (y/n): ")
if wantOneDrive == "n":
    print("Done!")
    exit(0)

os.system("bash get-onedrive")
login = input("Login to OneDrive now (y/n): ")
if login == "y":
    os.system("onedrive")
    doSync = input("Sync to OneDrive now (y/n): ")
    if doSync == "y":
        fullSync = input("Full sync (y/n): ")
        if fullSync == "y":
            os.system("onedrive --synchronize")
        else:
            os.system("cp ./onedrive-config ~/.config/onedrive/config")
            os.system("onedrive --synchronize --resync")
else: 
    print("Use command 'sync' to sync in future!")

print("Done!")
