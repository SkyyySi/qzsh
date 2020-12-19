#!/bin/env bash
LANG=C
#WIDTH="${COLUMNS:-$(tput cols)}"

# Hide the cursor.
setterm -cursor off

# Check the used distro.
if [[ -n $(grep -w 'ID_LIKE=*' '/etc/os-release') ]]; then
	eval $(grep -w 'ID_LIKE=*' '/etc/os-release') && \
	DISTRO=$ID_LIKE
else
	eval $(grep -w 'ID=*' '/etc/os-release') && \
	DISTRO=$ID
fi

echo -e '[#.........] Installing dependencies...'

# Use the apropriate package manager for your distro.
case $DISTRO in
	debian) sudo apt-get install -y git zsh curl wget;;
	arch)   sudo pacman -Syu --noconfirm --needed git zsh curl wget;;
	*)      echo 'This script only supports Debian and Arch Linux based distributions!'; exit 1;;
esac

# Create the directory all qzsh files will be located in.
if [[ ! -d "${PREFIX}" ]]; then
	mkdir -p "${HOME}/.qzsh/init" &&\
	PREFIX="${HOME}/.qzsh"
fi

echo -e '[##........] Backing up files...'

# Create the backup directory.
mkdir -p "${HOME}/.qzsh_backups"

# Move files to the backup directory.
mv "${ZDOTDIR:-$HOME}/.zshrc" "${HOME}/.qzsh_backups"

echo -e '[###.......] Installing oh-my-zsh...'

# Clone the oh-my-zsh Github repo.
git clone https://github.com/ohmyzsh/ohmyzsh.git "${PREFIX}/omz"

# Copy the sample zshrc provided with oh-my-zsh, but don't use it as the main zshrc.
# Instead, it is just used to load oh-my-zsh correctly.
cp "${PREFIX}/templates/zshrc.zsh-template" "${PREFIX}/init/omz.zshrc"

# Adjust the path to oh-my-zsh.
sed -i 's|export ZSH=$HOME/.oh-my-zsh|export ZSH="${HOME}/.qzsh/omz"|g'

# Install my zsh theme.
cp "${0:A:h}/files/skyyysi.zsh-theme" "${PREFIX}/omz/custom/themes/skyyysi.zsh-theme"

# Disable oh-my-zsh's plugin handeler.
sed -i 's|plugins=(git)|# plugins=(git)|g'

# Disable oh-my-zsh's theme handeler.
sed -i 's|ZSH_THEME="robbyrussell"|# ZSH_THEME="robbyrussell"|g'

echo -e '[##########] All done! Enjoy :)'