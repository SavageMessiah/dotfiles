function sshstart
    ssh-agent -c | source
    ssh-add
end
