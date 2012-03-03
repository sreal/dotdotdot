#!/bin/bash
#
# Load the global .bashrc 
# Then the specific platform

## ## ## ## ## ## ## ##
# GLOBAL CONFIGURATION (across boxes) 
# 
alias .='echo $PWD'
alias ..='cd ..'
alias ...='cd ../..'
alias ll='ls -lAhG'


## ## ## ## ## ## ## ##
# SOURCE PLATFORM SPECIFIC 
# Get the platform's .bashrc source
platform = $(uname)
if   [[ "$platform" == 'Linux' ]]; then
    file="~/.bash/linux/.bashrc"
elif [[ "$platform" == 'MIGW32_NT-6.1' ]]; then
    file="~/.bash/windows/.bashrc"
elif [[ "$platform" == 'Darwin' ]]; then
    file="~/.bash/osx/.bashrc"
fi
echo "Loading $(file)
if [[ -e $(file) ]] ; then 
    source $(file)
else
    echo "File Not Found ($(file))
fi
