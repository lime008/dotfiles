if status is-interactive
    # Commands to run in interactive sessions can go here
	fish_vi_key_bindings
end

alias dotf="git dotf"

fish_add_path $HOME/go/bin
fish_add_path $HOME/.cargo/bin

set -x ANDROID_HOME $HOME/Android/Sdk
