function fish_prompt
    # This is a simple prompt. It looks like
    # alfa@nobby /path/to/dir $
    # with the path shortened and colored
    # and a "#" instead of a "$" when run as root.
    set -l symbol ' $ '
    set -l color $fish_color_cwd
    if fish_is_root_user
        set symbol ' # '
        set -q fish_color_cwd_root
        and set color $fish_color_cwd_root
    end

	set_color -o green

    echo -n "$USER "

    set_color $color
    echo -n (prompt_pwd)

    set_color yellow
	echo -n (fish_git_prompt)

	set_color green
    echo -n $symbol
end
