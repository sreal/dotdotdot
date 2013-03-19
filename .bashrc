#!/bin/bash
#
# Load the global .bashrc
# Then the specific platform

## ## ## ## ## ## ## ##
# GLOBAL CONFIGURATION (across boxes)
#
#echo "Global configuration loaded (~/.bashrc)"

#-------------------------------------------------------------
# Interactive Safety
#-------------------------------------------------------------
# If not running interactively, don't do anything
[ -z "$PS1" ] && return
# Let's not shoot ourselves in the face
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls)
#-------------------------------------------------------------
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
# Directory Movement
#-------------------------------------------------------------
alias .='echo $PWD'
alias ..='cd ..'
alias ...='cd ../..'


## ## ## ## ## ## ## ##
# SOURCE PLATFORM SPECIFIC
# Get the platform's .bashrc source
platform=$(uname)
if   [[ "$platform" == 'Linux' ]]; then
    file="$HOME/.bash/linux/.bashrc"
elif [[ "$platform" == 'MINGW32_NT-6.1' ]]; then
    file="$HOME/.bash/windows/.bashrc"
elif [[ "$platform" == 'MINGW32_NT-6.2' ]]; then
    file="$HOME/.bash/windows/.bashrc"
elif [[ "$platform" == 'Darwin' ]]; then
    file="$HOME/.bash/osx/.bashrc"
fi
if [[ -e $file ]] ; then
    source $file
    #echo "Custom configuration loaded ($file)"
fi
