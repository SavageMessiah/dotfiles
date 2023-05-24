set -x EDITOR "emacs"
set -x VISUAL "emacs"
set -x GIT_EDITOR "emacs"

set -x BAT_THEME Nord

if status is-interactive
    zoxide init fish | source
    starship init fish | source
end
set FZF_CTRL_T_COMMAND fd
set -x FZF_CTRL_T_OPTS "--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {} || exa -lbT --git {}'"i

set -x PATH ~/bin ~/.cargo/bin /usr/local/bin /bin /usr/bin

set -x GOPATH ~/.local/go

set fish_greeting

alias ll='exa -lb --git --icons -g'
alias lt='exa -lbT --git'
alias ls='exa'
alias la='exa -a'
alias cdr='cd (git rev-parse --show-toplevel)'

abbr -g gc 'git commit'
abbr -g gs 'git status'
abbr -g gg 'lazygit'
abbr -g n 'nvim'
abbr -g j 'just'
abbr -g e 'emacs'
