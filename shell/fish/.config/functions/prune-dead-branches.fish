function prune-dead-branches --description "Remove local and remote branches that are behind the default branch"
    set main_branch (git-default-branch)
    git switch $main_branch || return $status
    git pull || return $status
    git fetch --prune || return $status
    set branches (git branch --remote --merged $main_branch | egrep -v '^.*(master|main|dev$|develop)$')
    if test -n "$branches"
        echo "Found branches to prune"
        for branch in $branches
            echo $branch
        end
        confirm "Do you want to prune these branches?" || return 0
        for branch in $branches
            set branch (string trim $branch) || return $status
            set branch (string replace "origin/" "" $branch) || return $status
            git push origin --delete $branch
        end
    end
    echo "Done pruning"
end
