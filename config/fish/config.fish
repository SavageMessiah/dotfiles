set -x PYENV_ROOT ~/.pyenv
set fish_user_paths ~/.emacs.d/bin ~/.dotfiles/bin $PYENV_ROOT/bin ~/.cargo/bin ~/go/bin ~/bin /usr/local/opt/ruby/bin

set -x EDITOR "emacsclient"
set -x VISUAL "emacsclient"
set -x GIT_EDITOR "emacsclient"

set -x BAT_THEME Nord

# pyenv
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

if status is-interactive
    zoxide init fish | source
    starship init fish | source
end
set FZF_CTRL_T_COMMAND fd
set -x FZF_CTRL_T_OPTS "--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {} || exa -lbT --git {}'"i

set fish_greeting

abbr -g gc 'git commit'
abbr -g gs 'git status'
abbr -g gg 'lazygit'
abbr -g cdr 'cd (git rev-parse --show-toplevel)'
abbr -g lt 'exa -lbT --git --icons'
abbr -g ll 'exa -lb --git --icons'
abbr -g ls 'exa --icons'
abbr -g n 'nvim'
abbr -g j 'just'
abbr -g e 'emacsclient'
abbr -g tf 'terraform'
abbr -g tfv 'terraform validate'
abbr -g repl 'clojure -M:dev:test:repl/cider:+default'
