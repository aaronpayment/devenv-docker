#FROM debian:latest
FROM golang:latest

RUN apt-get update && apt-get install -y \
    emacs24-nox \
    tmux \
    git \
    man \
    # golang-go \
 && rm -rf /var/lib/apt/lists/*

ENV TERM xterm-256color

# Setup home environment
RUN useradd dev
RUN mkdir /home/dev && chown -R dev: /home/dev
ENV HOME /home/dev
WORKDIR /home/dev
RUN mkdir -p $HOME/.ssh && chmod 700 $HOME/.ssh 
COPY dotfiles/.emacs.d $HOME/.emacs.d
COPY dotfiles/.bashrc $HOME/.bashrc
COPY dotfiles/.tmux.conf $HOME/.tmux.conf
RUN chown -R dev: $HOME

RUN mkdir -p /src
RUN mkdir -p /repos
WORKDIR /src
user dev

ENTRYPOINT ["emacs"]
