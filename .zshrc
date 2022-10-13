source ~/.config/zsh/zsh-snap/znap.zsh

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle :compinstall filename '$HOME/.zshrc'

source $HOME/.config/zsh/shrink-path.zsh
source $HOME/.config/znap/zsh-snap/znap.zsh

znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-completions

autoload -Uz compinit
autoload -Uz vcs_info
compinit

HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
setopt autocd
unsetopt beep
bindkey -v

if [[ ${SSH_TTY} ]]; then
	USE_ICONS=false
else
	USE_ICONS=true
fi


git_prompt_info() {
	branch=$(git branch --show-current 2>/dev/null || true)
	if [[ "$branch" != "" ]]; then
		echo "%F{3}($branch)%f "
	fi
}

host_prompt_info() {
	if $USE_ICONS; then
		echo " %n "
	else
		echo "%n@%m "
	fi
}

date_prompt() {
	if $USE_ICONS; then
		echo " $(date +"%H:%M:%S")"
	else
		echo "$(date +"%H:%M:%S")"
	fi 
}

prompt_dir() {
	echo "$(shrink_path -f)"
}

PROMPT='%B%F{green}$(host_prompt_info)%f%F{cyan}$(prompt_dir)%f %F{green}$(git_prompt_info)%f%F{green}$%f%b '

setopt PROMPT_SUBST
RPROMPT='%F{8}$(date_prompt)%f'

xhost +local:root > /dev/null 2>&1

##### [ Aliases ] #####

# Colors
alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

alias cp='cp -i'                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='vim -w PKGBUILD'

alias ssh='kitty +kitten ssh'
alias vim='nvim'

# kitty
alias ssh="kitty +kitten ssh"
alias dotf="git dotf"
