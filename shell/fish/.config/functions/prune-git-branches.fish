function prune-git-branches --description "Remove all local branches that have been merged into master"
    set main_branch (git-default-branch)
    git fetch --prune || return $status
    git branch --merged $main_branch | egrep -v '^(\*|\s*master$|\s*main$|\s*dev$|\s*develop$)' | xargs git branch -d
end
