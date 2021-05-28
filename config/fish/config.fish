#let env overrides from connect.kak take effect
if test -z "$KAKOUNE_SESSION"
    set PATH ~/.dotfiles/bin ~/bin ~/go/bin ~/.cabal/bin ~/.cargo/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin
end

set -x EDITOR "nvim"
set -x VISUAL "nvim"
set -x GIT_EDITOR "nvim"

set -x BAT_THEME Nord

if status is-interactive
    zoxide init fish | source
    starship init fish | source
end
set FZF_CTRL_T_COMMAND fd
set -x FZF_CTRL_T_OPTS "--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {} || exa -lbT --git {}'"

set fish_greeting

abbr -g gc 'git commit'
abbr -g gs 'git status'
abbr -g gg 'lazygit'
abbr -g cdr 'cd (git rev-parse --show-toplevel)'
abbr -g lt 'exa -lbT --git'
abbr -g ll 'exa -lb --git'
abbr -g ls 'exa'
abbr -g n 'nvim'
