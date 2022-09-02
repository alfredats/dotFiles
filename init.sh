#!/bin/bash

echo "Enabling bluetooth on startup (for all users)"
sudo systemctl enable bluetooth

echo "Installing necessities"
sudo pacman -Syu git tmux flatpak neovim 

echo "Installing quality of life tools"
sudo pacman -Syu ripgrep tealdeer fd


# PUT IN FUNCTION
echo "Installing ibus, and ibus-sunpinyin"
sudo pacman -Syu ibus ibus-sunpinyin
# DO THIS WITH SED INSTEAD
echo -e "GTK_IM_MODULE=ibus\nQT_IM_MODULE=ibus\nXMODIFIERS=@im=ibusg" >> /etc/environment && ln -s ./xprofile ~/.xprofile


# PUT IN FUNCTION
echo "Installing node version manager..."
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash 
echo -e 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm' >> ~/.bash_profile


# PUT IN FUNCTION
echo "Installing SDKMan (for java & maven)"

# PUT IN FUNCTION 
echo "Installing rustup"


# PUT IN FUNCTION
echo "Installing pyenv"
sudo pacman -S --needed base-devel openssl zlib xz tk # PYTHON DEPENDENCIES




