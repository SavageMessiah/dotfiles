# Defined in /home/ken/.config/fish/functions/fish_user_key_bindings.fish @ line 2
function fish_user_key_bindings
  fzf_key_bindings
  fish_vi_key_bindings insert

  bind -M insert \cf forward-char
  bind -M insert \cp up-or-search
  bind -M insert \cn down-or-search
  bind -M insert \ck history-token-search-backward
  bind -M insert \cl nextd-or-forward-word
  bind -M insert \ch prevd-or-backward-word
end
