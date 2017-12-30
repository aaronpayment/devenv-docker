## Docker dev env
if [ $DEVENV ]; then
   alias devenvl='docker run --rm -ti -v shared:/shared -v /var/run/docker.sock:/var/run/docker.sock --entrypoint=bash aaronpayment/devenv:latest'
else
   alias emacs='docker run --rm -ti -v $(pwd):/host_share aaronpayment/devenv:stable'
   alias devenvl='docker run --rm -ti -v shared:/shared -v $HOME/.ssh:/home/dev/.ssh -v $(pwd):/host_share -v /var/run/docker.sock:/var/run/docker.sock --entrypoint=bash aaronpayment/devenv:latest'
fi
