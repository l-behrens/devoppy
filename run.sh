#!/bin/bash

IMAGE=${IMAGE:-devoppy}
PATH=/bin:/usr/bin:/sbin:/usr/sbin:/root/scripts/:$PATH
EXEC=${SHELL}
[ "$(id -u)" != "0" ] && SUDO=sudo

docker_base(){
        docker run \
	-v /etc/localtime:/etc/localtime \
        -v /etc/passwd:/etc/passwd \
        -v /etc/shadow:/etc/shadow \
	-v /etc/group:/etc/group \
	-v /etc/sudoers:/etc/sudoers \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v $(which docker):/usr/bin/docker \
        -v $HOME:$HOME \
	-e HOME=$HOME \
        -e PS1="$PS1" \
        -e LS_COLORS=$LS_COLORS \
        -e LANG=$LANG \
        -e PATH=$PATH \
	"$@"
}


D(){
#set -x
        docker_base \
	--net=host \
        --rm \
	-ti \
	--security-opt="label:disable" \
        --hostname="$(hostname)-dev" \
        -e DISPLAY=unix:0 \
        -e USER=$USER \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        --workdir $(pwd) \
	"$@" \
	$IMAGE \
        "$EXEC"
}

T(){
#set -x
        docker_base \
	--net=host \
        --rm \
	-ti \
	--security-opt="label:disable" \
        --hostname="$(hostname)-test" \
        -e DISPLAY=unix:0 \
        -e USER=$USER \
	-e TEST="true" \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        --workdir $(pwd) \
	"$@" \
	$IMAGE \
        "$EXEC"
}

devc_build(){
  docker build --build-arg UID=$(id -u) \
          --build-arg GID=$(id -g) \
	  --build-arg UNAME=$(echo $USER)
          -f Dockerfile -t devoppy .
  }

#PY(){
# docker run -v /etc/localtime:/etc/localtime \
#        -v /etc/passwd:/etc/passwd \
#        -v /etc/shadow:/etc/shadow \
#        -v /etc/group:/etc/group \
#        -v /etc/sudoers:/etc/sudoers \
#        -v /var/run/docker.sock:/var/run/docker.sock \
#        -v $HOME:$HOME \
#        -e HOME=$HOME \
#        -e PS1="$PS1" \
#        -e LS_COLORS=$LS_COLORS \
#        -e LANG=$LANG \
#        -e PATH=$PATH \
#        --rm \
#        -it \
#        --hostname="$(hostname)-D" \
#        -e DISPLAY=unix:0 \
#        -e USER=$USER \
#        -v /tmp/.X11-unix:/tmp/.X11-unix \
#        --workdir $(pwd) \
#        devoppy zsh
#}
