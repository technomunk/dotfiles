function docker-clean --wraps='docker rm $(docker ps -aq --filter="status=exited"); docker rmi $(docker images -aq --filter="dangling=true")' --description 'alias docker-clean=docker rm $(docker ps -aq --filter="status=exited"); docker rmi $(docker images -aq --filter="dangling=true")'
  docker rm $(docker ps -aq --filter="status=exited"); docker rmi $(docker images -aq --filter="dangling=true") $argv
end
