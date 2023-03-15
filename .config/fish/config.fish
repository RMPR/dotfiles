if status is-interactive
    abbr --add gco git checkout
    abbr --add gsp git stash pop
    # Commands to run in interactive sessions can go here
end

# Automatically change the directory in fish after closing ranger
#
# This is a fish alias to automatically change the directory to the last visited
# one after ranger quits.
# To undo the effect of this function, you can type "cd -" to return to the
# original directory.
#
# Note: funcsave save the alias in fish's config files, you do not need to copy
# this file anywhere, just execute it once

function ranger-cd
    set dir (mktemp -t ranger_cd.XXX)
    ranger --choosedir=$dir
    cd (cat $dir) $argv
    rm $dir
    commandline -f repaint
end
funcsave ranger-cd

# Config for installing npm binaries without sudo
set NPM_PACKAGES "$HOME/.npm-packages"
set PATH $PATH $NPM_PACKAGES/bin
set MANPATH $NPM_PACKAGES/share/man $MANPATH

# To bind Ctrl-O to ranger-cd, save this in `~/.config/fish/config.fish`:
bind \co ranger-cd
bind \cn nvim .

# bind CTRL-Z to put the last suspended job to the foreground
bind \cz 'fg 2>/dev/null; commandline -f repaint'
starship init fish | source
zoxide init fish | source
set fish_greeting
status --is-login; and status --is-interactive; and exec byobu-launcher
