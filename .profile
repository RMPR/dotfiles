export KDEWM=/usr/bin/i3
export EDITOR=/usr/bin/vimx
export VISUAL=/usr/bin/nvim
export GDK_BACKEND=wayland,x11
export CLUTTER_BACKEND=wayland
PATH="$HOME/bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"
export _JAVA_AWT_WM_NONREPARENTING=1
export WEECHAT_HOME=$HOME/.config/weechat
export XDG_CONFIG_HOME=$HOME/.config
PATH="$PATH:$XDG_CONFIG_HOME/emacs/bin"
export VIMCONFIG=$HOME/.vim
export CLUTTER_BACKEND=x11 # Fix Shotwell
export TERMINAL=alacritty
_byobu_sourced=1 . /usr/bin/byobu-launch 2>/dev/null || true
. "$HOME/.cargo/env"
