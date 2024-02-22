function vc --description "Launch code with virtual environment preactivated"
    pushd $argv[1] && source .venv/bin/activate.fish && code . $argv[2..]
    deactivate
    popd
end
