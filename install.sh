#!/usr/bin/bash

#install xorg and xinit
sudo pacman -S xorg aorg-xinit

# install yay
git clone https://aur.archlinux.org/yay-bin.git ~
cd ~/yay-bin
makepkg -si

#configure git credentials
git config --global user.name "Therebelknight"
git config --global user.email "therebelnino@gmail.com"
#install git credential manager
curl -L https://aka.ms/gcm/linux-install-source.sh | sh
git-credential-manager configure
#A bit extra
export GCM_CREDENTIAL_STORE=cache
# or
git config --global credential.credentialStore cache

export GCM_CREDENTIAL_CACHE_OPTIONS="--timeout 300"
# or
git config --global credential.cacheOptions "--timeout 300"

#install zsh and configure it
sudo pacman -S zsh wget
cd ~
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh ~
sh install.sh

cd ~
rm .zshrc .zprofile
cp ~/asephan/.zshrc .
cp ~/asephan/.zprofile .

#install qtile and polybar
cd ~
sudo pacman -S qtile polybar
#move config to here
cp ~/asephan/qtile/config.py ~/.config/qtile/
cd ~/.config/
mkdir polybar
cd polybar
#move config  here
cp ~/asephan/polybar/* .


#install neovim and kickstart
cd ~
sudo pacman -S neovim ripgrep npm unzip
git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
#move config here
cp ~/asephan/init.lua ~/.config/nvim/init.lua


#install rust
cd ~
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
mkdir Rust
cd Rust
cargo install rustlings
rustlings

#install kitty and font
cd ~
sudo pacman -S kitty ttf-fantasque-nerd
kitten themes
#move conf files
cp ~/asephan/kitty/* ~/.config/kitty/


#miscallaneous
cd ~
yay -S 1password
sudo pacman -S firefox man thunderbird
echo Remember to sign into these
