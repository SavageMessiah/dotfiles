# Defined in /var/folders/1m/b52349ms34x7fd0pxdlnf8m40000gn/T//fish.5dx3Yi/kc.fish @ line 2
function kc
    set -gx KAKOUNE_SESSION (kak -l | fzf)
end
