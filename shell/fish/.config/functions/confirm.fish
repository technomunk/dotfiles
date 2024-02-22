function confirm --description "Get a confirmation from the user"
    set prompt $argv[1]
    if test -z $prompt
        set prompt "Are you sure?"
    end
    read -l -P "$prompt [Y/n]" answer
    switch $answer
    case N n no -
        return 1
    case *
        return 0
    end
end
