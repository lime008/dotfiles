if status is-interactive
    # Commands to run in interactive sessions can go here
	fish_vi_key_bindings
end

alias dotf="git dotf"
alias vim="nvim"

fish_add_path -m ~/go/bin
fish_add_path -m ~/.krew/bin
fish_add_path -m ~/.cargo/bin

set -x ANDROID_HOME ~/Android/Sdk
