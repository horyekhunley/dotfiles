if test -e ~/.nix-profile/etc/profile.d/nix.fish
    source ~/.nix-profile/etc/profile.d/nix.fish
end

if status is-interactive

# Disable fish greeting
    set -U fish_greeting
    # Commands to run in interactive sessions can go here
    alias e="exit"
    alias pip="uv pip"
    alias ls="eza --icons=always --color-scale=all"
    alias l='eza -1A --group-directories-first --color=always --git-ignore'
    #alias ls='l'
    alias la='l -l --time-style="+%Y-%m-%d %H:%M" --no-permissions --octal-permissions'
    alias tree='l --tree'
    alias c="clear"
    alias t="tmux"
end

# !! Contents within this block are managed by 'conda init' !!
if test -f /home/mb/miniconda3/bin/conda
    eval /home/mb/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/mb/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/mb/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/mb/miniconda3/bin" $PATH
    end
end

starship init fish | source
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
