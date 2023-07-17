function snap
    set name (date +%Y-%m-%dT%H:%M:%S)
    sudo zfs snapshot zroot/home@$name
    echo made snapshot of home called $name
end
