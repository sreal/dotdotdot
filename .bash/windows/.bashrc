#!/bin/bash
#
# Custom configuration for windows boxes
#echo "Custom configuration loaded (~/.bash/windows/.bashrc)"
#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls)
#-------------------------------------------------------------
alias ls='ls -ah --color=auto'  # add colors for filetype recognition
alias ll="ls -l"
#-------------------------------------------------------------
# Override Shell Prompt (no uptime)
#-------------------------------------------------------------

PS1='\[\033]0;$MSYSTEM:\w\007 \033[32m\]\u@\h \[\033[33m\W$(__git_ps1)\033[0m\] > '
#-------------------------------------------------------------
# Program list specific to the machine
#-------------------------------------------------------------
alias notepad='/c/Applications/notepad++/notepad++.exe'
alias open=explorer
#-------------------------------------------------------------
# The 'grep' family
#-------------------------------------------------------------
alias rgrep='grep -ri'
