# Default Theme

if patched_font_in_use; then
    TMUX_POWERLINE_SEPARATOR_LEFT_BOLD="⮂"
    TMUX_POWERLINE_SEPARATOR_LEFT_THIN="⮃"
    TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD="⮀"
    TMUX_POWERLINE_SEPARATOR_RIGHT_THIN="⮁"
else
    TMUX_POWERLINE_SEPARATOR_LEFT_BOLD="◀"
    TMUX_POWERLINE_SEPARATOR_LEFT_THIN="❮"
    TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD="▶"
    TMUX_POWERLINE_SEPARATOR_RIGHT_THIN="❯"
fi

TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR:-'235'}
TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR:-'255'}

TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}
TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}


# Format: segment_name background_color foreground_color [non_default_separator]

if [ -z $TMUX_POWERLINE_LEFT_STATUS_SEGMENTS ]; then
    TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
        # "tmux_session_info 148 234" \
        "tmux_session_info 3 17" \
        #"hostname 33 0" \
        "hostname 234 255" \
        #"ifstat 30 255" \
        #"ifstat_sys 30 255" \
        # "ifstat_sys 22 80" \
        #"lan_ip 22 80" \
        "lan_ip 19 255" \
        # "lan_ip 24 255 ${TMUX_POWERLINE_SEPARATOR_RIGHT_THIN}" \
        #"wan_ip 24 255" \
        #"vcs_branch 130 232" \
        # "vcs_branch 22 135" \
        # "vcs_compare 16 255" \
        # "vcs_staged 18 250" \
        # "vcs_modified 103 17" \
        #"vcs_others 245 0" \
    )
fi

if [ -z $TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS ]; then
    TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
        #"earthquake 3 0" \
        #"pwd 89 211" \
        "pwd 54 211" \
        "vcs_branch 130 232" \
        #"mailcount 9 255" \
        #"now_playing 234 37" \
        #"cpu 240 136" \
        "load 234 3" \
        # "load 237 167" \
        #"tmux_mem_cpu_load 234 136" \
        #"battery 137 127" \
        #"battery 22 80" \
        #"weather 37 255" \
        #"rainbarf 0 0" \
        # "xkb_layout 125 117" \
        # "xkb_layout 235 117" \
        "date_day 88 136" \
        "date 88 136 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
        "time 88 136 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
        #"utc_time 235 136 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
    )
fi
