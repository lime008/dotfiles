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

sudo pacman -S $PKGS

# Install packer for neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install nvim dependencies
nvim +PackerInstall +qall

sudo systemctl enable autorandr
sudo systemctl start autorandr
