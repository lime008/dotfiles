if status is-interactive
    # Commands to run in interactive sessions can go here
	fish_vi_key_bindings
end

# Colors
set --universal fish_color_autosuggestion 555\x1ebrblack
set --universal fish_color_cancel \x2dr
set --universal fish_color_command blue
set --universal fish_color_comment brblack
set --universal fish_color_cwd brcyan
set --universal fish_color_cwd_root red
set --universal fish_color_end green
set --universal fish_color_error brred
set --universal fish_color_escape brcyan
set --universal fish_color_history_current \x2d\x2dbold
set --universal fish_color_host normal
set --universal fish_color_host_remote yellow
set --universal fish_color_normal normal
set --universal fish_color_operator brcyan
set --universal fish_color_param cyan
set --universal fish_color_quote brgreen
set --universal fish_color_redirection cyan\x1e\x2d\x2dbold
set --universal fish_color_search_match bryellow\x1e\x2d\x2dbackground\x3dbrblack
set --universal fish_color_selection white\x1e\x2d\x2dbold\x1e\x2d\x2dbackground\x3dbrblack
set --universal fish_color_status red
set --universal fish_color_user brgreen
set --universal fish_color_valid_path \x2d\x2dunderline

# Git prompt
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_show_untrackedfiles 1

set -g __fish_git_prompt_color brblack --bold
set -g __fish_git_prompt_color_branch brmagenta
set -g __fish_git_prompt_color_dirtystate brblue
set -g __fish_git_prompt_color_stagedstate bryellow
set -g __fish_git_prompt_color_invalidstate brred
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate green --bold

# Aliases

alias dotf="git dotf"
alias vim="nvim"

fish_add_path -m ~/go/bin
fish_add_path -m ~/.krew/bin
fish_add_path -m ~/.cargo/bin

set -x ANDROID_HOME ~/Android/Sdk
