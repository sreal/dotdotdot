#!/bin/bash
#
# Load the global .bashrc 
# Then the specific platform

## ## ## ## ## ## ## ##
# GLOBAL CONFIGURATION (across boxes) 
# 
#echo "Global configuration loaded (~/.bashrc)"
alias .='echo $PWD'
alias ..='cd ..'
alias ...='cd ../..'
alias ll='ls -lAhG'


## ## ## ## ## ## ## ##
# SOURCE PLATFORM SPECIFIC 
# Get the platform's .bashrc source
platform=$(uname)
if   [[ "$platform" == 'Linux' ]]; then
    file="$HOME/.bash/linux/.bashrc"
elif [[ "$platform" == 'MIGW32_NT-6.1' ]]; then
    file="$HOME/.bash/windows/.bashrc"
elif [[ "$platform" == 'Darwin' ]]; then
    file="$HOME/.bash/osx/.bashrc"
fi
echo $file
if [[ -e $file ]] ; then 
	source $file
#	echo "Custom configuration loaded ($file)"
else
	cat $file
#    echo "Custom configuration not found ($file)"
fi
