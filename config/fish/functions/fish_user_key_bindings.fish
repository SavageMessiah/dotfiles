function bind_bang
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function bind_dollar
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

function fish_user_key_bindings
  fzf_key_bindings
  fish_vi_key_bindings insert

  bind -M insert \cf forward-char
  bind -M insert \cp up-or-search
  bind -M insert \cn down-or-search

  bind -M insert ! bind_bang
  bind -M insert '$' bind_dollar
end
