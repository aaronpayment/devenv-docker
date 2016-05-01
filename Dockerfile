FROM debian:latest

RUN apt-get update && apt-get install -y \
    emacs24-nox

ENV TERM xterm-256color
COPY dotfiles/.emacs.d /root/.emacs.d

RUN mkdir -p /src
WORKDIR /src

ENTRYPOINT ["emacs"]