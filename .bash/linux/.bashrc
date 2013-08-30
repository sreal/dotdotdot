#!/bin/bash
#
# Custom configuration for linux boxes

# All taken from
#http://tldp.org/LDP/abs/html/sample-bashrc.html
#-------------------------------------------------------------
# Shell Prompt
#-------------------------------------------------------------
if [[ "${DISPLAY%%:0*}" != "" ]]; then
    HILIT=${red}   # remote machine: prompt will be partly red
else
    HILIT=${cyan}  # local machine: prompt will be partly cyan
fi
PS1='  \n\r  \#: \[\033[31m\]\u\[\033[1;32m\]:\[\033[34m\] \w\[\033[m\]\[\033[33m\] \e[0;33m[\T]\e[m $(__git_ps1)\n\r  > \[\033[37m\]'
#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls)
#-------------------------------------------------------------
alias ll="ls -l --group-directories-first"
alias ls='ls -hF --color'  # add colors for filetype recognition
alias l='ls -AlXB'           # show hidden files
alias la='ls -Al'          # show hidden files
alias lx='ls -lXB'         # sort by extension
alias lk='ls -lSr'         # sort by size, biggest last
alias lc='ls -ltcr'        # sort by and show change time, most recent last
alias lu='ls -ltur'        # sort by and show access time, most recent last
alias lt='ls -ltr'         # sort by date, most recent last
alias lm='ls -al |more'    # pipe through 'more'
alias lr='ls -lR'          # recursive ls
alias tree='tree -Csu'     # nice alternative to 'recursive ls'
#-------------------------------------------------------------
# The 'grep' family
#-------------------------------------------------------------
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias rgrep='grep -rin --color=auto'
#-------------------------------------------------------------
# Program list specific to the machine
#-------------------------------------------------------------
#alias notepad='/c/Program\ Files\ \(x86\)/Notepad++/notepad++.exe'
alias open=nautilus
export EDITOR=emacs

#-------------------------------------------------------------
# Set the primary monitor of more than one found.
#-------------------------------------------------------------
NR_OF_MONITORS=$(xrandr -d :0 -q | grep ' connected' | wc -l)
if [ $NR_OF_MONITORS = "3" ]; then
  xrandr --output DVI-0 --primary
fi
