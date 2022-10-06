PKGS="git \
i3exit \
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
viu \
bat \
peek \
maim \
autorandr \
gopass \
gopass-jsonapi \
neovim \
stylua \
go \
ripgrep \
ttf-nerd-fonts-symbols-1000-em"

sudo pacman -Sy $PKGS

sudo systemctl enable autorandr
sudo systemctl start autorandr

# setup config tracking
REPO=https://github.com/lime008/dotfiles
DOTFILES="$HOME/.dotfiles"
git clone --bare $REPO $DOTFILES ||(git --git-dir="$DOTFILES" --work-tree="$HOME" pull)
git --git-dir=$HOME/.dotfiles config --local status.showUntrackedFiles no
git config --global alias.dotf '!git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# Install packer for neovim
PACKER_INSTALL_DIR=~/.local/share/nvim/site/pack/packer/start/packer.nvim

if [ ! -d $PACKER_INSTALL_DIR ]; then
	git clone --depth 1 https://github.com/wbthomason/packer.nvim $PACKER_INSTALL_DIR
else
	git -C $PACKER_INSTALL_DIR pull --depth 1 
fi

# Install nvim dependencies
nvim +PackerInstall +PackerUpdate +PackerCompile +qall
nvim +PackerUpdate +qall
nvim +PackerCompile +qall

go install github.com/segmentio/golines@latest
