export PATH="$HOME/bin:$PATH"
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad

purple='\[\033[0;35m\]'
default='\[\033[0m\]'
export PS1="$purple$PS1$default"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
