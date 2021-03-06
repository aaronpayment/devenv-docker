FROM debian:latest

RUN apt-get update && apt-get install -y \
    curl \
    emacs24-nox \
    git \
    locales \
    make \
    man \
    sudo \
    tmux \
    wget \
 && rm -rf /var/lib/apt/lists/*

ENV DEVENV 1
ENV TERM xterm-256color
ENV SHELL /bin/bash

# Set Locale otherwise tmux gets upset
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
        update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8

# Install Docker
RUN wget -P /usr/local/bin/ https://master.dockerproject.org/linux/x86_64/docker && chmod 755 /usr/local/bin/docker

# Install go
RUN curl https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz | tar -C /usr/local -zx
ENV GOROOT /usr/local/go
ENV PATH /usr/local/go/bin:$PATH
ENV GOPATH /repos

# Setup home environment
RUN useradd -G staff,sudo dev && echo "dev:dev" | chpasswd
RUN mkdir /home/dev && chown -R dev: /home/dev
ENV HOME /home/dev
WORKDIR /home/dev
RUN mkdir -p $HOME/.ssh && chmod 700 $HOME/.ssh 
COPY dotfiles/ $HOME/
RUN chown -R dev: $HOME
RUN echo 'export PS1="\u@\h:\w$ "' >> $HOME/.bash_extra

# Setup directories
RUN mkdir -p /repos && chown -R dev: /repos
RUN mkdir -p /host_share && chown -R dev: /host_share
RUN mkdir -p /shared && chown -R dev: /shared

WORKDIR /host_share
user dev

ENTRYPOINT ["emacs"]
