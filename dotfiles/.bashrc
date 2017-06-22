export PATH="$HOME/bin:$PATH"
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad

purple='\[\033[0;35m\]'
default='\[\033[0m\]'
export PS1="$purple$PS1$default"

for file in ~/.{bash_extra,bash_prompt,bash_exports,bash_aliases,bash_functions}; do
    [ -r ${file} ] && source ${file}
done
unset file
