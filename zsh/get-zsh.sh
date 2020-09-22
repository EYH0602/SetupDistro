
# install zsh,  oh-my-zsh, and the extensions
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# autojump
git clone git://github.com/wting/autojump.git
python ./autojump/install.py
sudo apt install autojump   # just to make sure
rm autojump -rf
# zsh syntax highlisgting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# zsh autosuggestions
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# my version of agnoster theme
cp ./agnoster.zsh-theme ~/.oh-my-zsh/themes/agnoster.zsh-theme
cp ./zshrc ~/.zshrc
source ~/.zshrc


