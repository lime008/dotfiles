export PS1="\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] "
export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=vim
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export GO111MODULE=on
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH=$HOME/.yarn/bin:$PATH
export PATH=$PATH:/home/lime/.linkerd2/bin
alias dotf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
