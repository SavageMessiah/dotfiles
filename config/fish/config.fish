set fish_user_paths ~/bin ~/.emacs.d/bin ~/.cargo/bin ~/go/bin ~/.local/bin
set -x EDITOR "emacs"
set -x VISUAL "emacs"
set -x GIT_EDITOR "emacs"
set rust_root (rustc --print sysroot)
set -x RUST_SRC_PATH "$rust_root/lib/rustlib/src/rust/src"

set -x BAT_THEME Nord

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
abbr -g lt 'exa -lbT --git'
abbr -g ll 'exa -lb --git'
abbr -g ls 'exa'
abbr -g n 'nvim'
abbr -g e 'emacs'
abbr -g j 'just'
