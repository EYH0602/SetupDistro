
# install zsh,  oh-my-zsh, and the extensions
sudo apt install zsh
# autojump
git clone git://github.com/wting/autojump.git
cd autojump
python ./install.py
sudo apt install autojump   # just to make sure
cd ..
rm autojump -rf
# zsh syntax highlisgting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git 
mv ./zsh-syntax-highlighting ~/.zsh-scripts
# my version of agnoster theme
cp ./agnoster.zsh-theme ~/.oh-my-zsh/themes/agnoster.zsh-theme
cp ./zshrc ~/.zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
source ~/.zshrc

