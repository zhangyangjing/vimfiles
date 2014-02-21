# User specific environment and startup programs
PATH=$PATH:$HOME/bin
export PATH

if [[ "$OSTYPE" == "darwin"* ]]; then
    alias ls='ls -G -G'
else
    alias ls='ls -G --color'
fi

alias l='ls'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -al'
alias lal='ls -al'
alias cls='clear'
#alias tmux='TERM=xterm-256color tmux'

export PS1="\u@\W\$ "
export CLICOLOR=1
export LSCOLORS=dxfxxxxxbxegedbxbxdxdx
export GREP_OPTIONS='--color=auto'
export PYTHONDONTWRITEBYTECODE=x
#export TERM=xterm-256color

# source bashrc
if [ -f ~/.bashrc  ]
then
    source ~/.bashrc
fi
