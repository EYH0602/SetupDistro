#!/bin/bash

# update and get package manager
sudo pacman -Syu
sudo pacman -S yay binutils make gcc pkg-config fakeroot

# get basic needs
yay -S vim dmd python3-pip python ghc cabal-install texlive-most \
    visual-studio-code-bin typora  neofetch sublime-text appmenu-gtk-module filezilla \
    discord onedrive-abraunegg signal slack-desktop wps-office trash-cli \
    ttf-firacode nerd-fonts-fira-code lightly-git papirus-icon-theme papirus-filezilla-themes \
    pulse-secure webkitgtk \
    pdfgrep translate-shell \
    msi-perkeyrgb \
    virtualbox dkms linux59-virtualbox-host-modules


# active virtualbox
sudo modprobe vboxdrv

