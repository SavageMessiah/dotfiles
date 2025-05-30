set -x EDITOR nvim
set -x VISUAL nvim
set -x GIT_EDITOR nvim

if status is-interactive
    zoxide init fish | source
    starship init fish | source
    source ~/.config/fish/kanagawa.fish
end
set FZF_CTRL_T_COMMAND fd
set -x FZF_CTRL_T_OPTS "--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {} || lsd -lg --tree {}'"i

set -x PATH ~/bin ~/.cargo/bin ~/.ghcup/bin ~/.local/bin /usr/local/bin /bin /usr/bin

set -x GOPATH ~/.local/go

set fish_greeting

alias ll='lsd -l'
alias lt='lsd --tree'
alias ls='lsd'
alias la='lsd -a'
alias cdr='cd (git rev-parse --show-toplevel)'
alias cbp='xclip -o -sel clip'
alias cbc='xclip -sel clip'

abbr -g gc 'git commit'
abbr -g gs 'git status'
abbr -g gg lazygit
abbr -g n nvim
abbr -g j just
abbr -g e emacs
