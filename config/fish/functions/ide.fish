function ide
    if test -z "$argv[1]"
        echo "Requires a project path"
        return 1
    end

    set path (realpath $argv[1])
    set dir $path
    if test ! -d $path
        set dir (dirname $path)
        #fish doesn't have subshells so cd would affect everything
        set git (git -C $dir rev-parse --show-toplevel)
        if test $status = 0
            set dir $git
        end
    else
        set -e path
    end

    set title (basename $dir)
    set id (kitty @ launch --tab-title "$title" --type tab\
                           --cwd "$dir"\
                           --copy-env kak -s "$title" -e ide $path)
    echo Started session $title in $dir. Tab id $id.
end
