PKGS="git \
neovim \
dunst \
rofi \
picom \
polybar \
pamixer \
i3lock \
pa-applet \
pavucontrol \
nitrogen \
playerctl \
kitty \
peek \
maim \
viu \
bat \
autorandr \
ripgrep \
i3exit"

sudo pacman -Sy $PKGS

# Install packer for neovim
PACKER_INSTALL_DIR=~/.local/share/nvim/site/pack/packer/start/packer.nvim

if [ ! -d $PACKER_INSTALL_DIR ]; then
	git clone --depth 1 https://github.com/wbthomason/packer.nvim $PACKER_INSTALL_DIR
else
	git -C $PACKER_INSTALL_DIR pull --depth 1 
fi

# Install nvim dependencies
nvim +PackerInstall +qall

sudo systemctl enable autorandr
sudo systemctl start autorandr
