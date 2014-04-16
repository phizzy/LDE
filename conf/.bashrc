# .bashrc
# set variable identifying the chroot you work in (used in the prompt below)

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color)
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    ;;
*)
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    ;;
esac

# Comment in the above and uncomment this below for a color prompt
# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# some more ls aliases
#alias l='ls -CF'


# User specific aliases and functions
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

alias diff='colordiff --exclude=CVS --exclude=.svn'
alias grep='grep --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias vim='/usr/local/Cellar/vim/7.4.253/bin/vim'
alias vi='vim'
alias gi='grunt-init'
alias goagent='python /Users/zhuhongjie/GoAgent/3.1.9/local/proxy.py &>/dev/null 2>&1 &'
alias v='vagrant'
export EDITOR=vim

export PATH=$HOME/.bin:$PATH
#export CVSROOT=:pserver:liyb@172.18.23.201:/data/cvsroot/
export CVSROOT=:pserver:lichengyin@newcvs.baidu.com:/data/cvsroot
#export PS1="\n\e[1;37m[\e[m\e[1;32m\u\e[m\e[1;33m@\e[m\e[1;35m\h\e[m \e[4m\`pwd\`\e[m\e[1;37m]\e[m\e[1;36m\n\e[m\\$ "
#export PS1="\n\e[1;37m[\e[m\e[1;32m\u\e[m\e[1;33m@\e[m\e[1;35m\h\e[m1;37m]$ "
#export PS1="\[\e[36;1m\]\u@\[\e[32;1m\]\H:~$\[\e[0m\] "
#export PS1="\[\e[36;1m\]\u@\[\e[32;1m\]\H:\W\$\[\e[0m\] "
export PS1="\[\e[36;1m\]\u@\[\e[32;1m\]\H:\w\[\e[0m\]\n$ "
#export VIMRUNTIME=/usr/local/files/vim/share/vim/vim70
#export LD_LIBRARY_PATH=/usr/local/lib:/usr/local/files/audacious/mcs-0.4.1/lib/:/usr/lib

#export GTK_IM_MODULE='scim-bridge'
#export LD_RUN_PATH
#export LD_LIBRARY_PATH
#use the `-Wl,--rpath -Wl,LIBDIR' linker flag
bind '"\x1b\x5b\x41":history-search-backward'
bind '"\x1b\x5b\x42":history-search-forward'

export PATH=/usr/local/bin:$PATH
