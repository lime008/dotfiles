PKGS="neovim \
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
i3exit"

sudo pacman -S $PKGS

# Install vim plug for neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
