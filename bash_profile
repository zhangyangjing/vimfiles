# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:$HOME/bin
export PATH

alias ls='ls -G'
alias l='ls'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -al'
alias lal='ls -al'

export PS1="\u@\W\$ "
export CLICOLOR=1
export LSCOLORS=dxfxxxxxbxegedbxbxdxdx
export GREP_OPTIONS='--color=auto'
