#!/bin/bash
#
# Custom configuration for osx boxes

# All taken from
#http://tldp.org/LDP/abs/html/sample-bashrc.html
#-------------------------------------------------------------
# Additional Sources and Configuration
#-------------------------------------------------------------
source /usr/local/git/contrib/completion/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=1
#-------------------------------------------------------------
# Shell Prompt
#-------------------------------------------------------------
if [[ "${DISPLAY%%:0*}" != "" ]]; then
    HILIT=${red}   # remote machine: prompt will be partly red
else
    HILIT=${cyan}  # local machine: prompt will be partly cyan
fi
PS1='  \n\r  \#: \[\033[31m\]\u@\h\[\033[1;32m\]:\[\033[34m\] \w\[\033[m\]\[\033[33m\] \e[0;33m[\T]\e[m $(__git_ps1)\n\r  > \[\033[37m\]'
#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls)
#-------------------------------------------------------------
alias ls='ls -hFG'  # add colors for filetype recognition
alias l='ls -AlBG'           # show hidden files
alias la='ls -Al'          # show hidden files
alias lk='ls -lSr'         # sort by size, biggest last
alias lc='ls -ltcr'        # sort by and show change time, most recent last
alias lu='ls -ltur'        # sort by and show access time, most recent last
alias lt='ls -ltr'         # sort by date, most recent last
alias lm='ls -al |more'    # pipe through 'more'
alias lr='ls -lR'          # recursive ls
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
