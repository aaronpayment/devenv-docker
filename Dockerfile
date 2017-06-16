#FROM debian:latest
FROM golang:latest

RUN apt-get update && apt-get install -y \
    emacs24-nox \
    tmux \
    git \
    # golang-go \
 && rm -rf /var/lib/apt/lists/*

ENV TERM xterm-256color
COPY dotfiles/.emacs.d /root/.emacs.d
COPY dotfiles/.bashrc /root/.bashrc
COPY dotfiles/.tmux.conf /root/.tmux.conf

RUN mkdir -p /src
WORKDIR /src

ENTRYPOINT ["emacs"]