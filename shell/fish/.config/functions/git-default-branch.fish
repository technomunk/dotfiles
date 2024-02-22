function git-default-branch --description "Get the default branch name for the repo in cwd"
    git remote show origin | sed -n '/HEAD branch/s/.*: //p'
end
