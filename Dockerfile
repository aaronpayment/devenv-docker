FROM debian:latest
#FROM golang:latest

RUN apt-get update && apt-get install -y \
    emacs24-nox \
    tmux \
    git \
    man \
    wget \
    # golang-go \
 && rm -rf /var/lib/apt/lists/*

ENV TERM xterm-256color

# Setup Docker
RUN wget -P /usr/local/bin/ https://master.dockerproject.org/linux/x86_64/docker && chmod 744 /usr/local/bin/docker

# Setup home environment
RUN useradd dev
RUN mkdir /home/dev && chown -R dev: /home/dev
ENV HOME /home/dev
WORKDIR /home/dev
RUN mkdir -p $HOME/.ssh && chmod 700 $HOME/.ssh 
COPY dotfiles/ $HOME/
RUN chown -R dev: $HOME

# Setup directories
RUN mkdir -p /src && chown -R dev: /src
RUN mkdir -p /repos && chown -R dev: /repos
RUN mkdir -p /host_share && chown -R dev: /host_share

WORKDIR /src
#user dev

ENTRYPOINT ["emacs"]
