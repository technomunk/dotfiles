function podsh --description="Find a kubernetees pod and connect to its interactive shell" --argument environment service_name
    set -l pod_name (kubectl --context "$environment-readwrite" get pod -l app=$service_name  | sed -n '2p' | sed 's/ .*//')
    kubectl --context "$environment-readwrite" exec $pod_name -it -- sh
end
