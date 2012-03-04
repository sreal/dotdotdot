#!/bin/bash
#
# Load the global .profile
# Then the specific platform

## ## ## ## ## ## ## ##
# GLOBAL CONFIGURATION (across boxes) 
# 
#echo "Global configuration loaded (~/.profile)"






## ## ## ## ## ## ## ##
# SOURCE PLATFORM SPECIFIC 
# Get the platform's .bashrc source
platform=$(uname)

if   [[ "$platform" == 'Linux' ]]; then
    file="$HOME/.bash/linux/.profile"
elif [[ "$platform" == 'MIGW32_NT-6.1' ]]; then
    file="$HOME/.bash/windows/.profile"
elif [[ "$platform" == 'Darwin' ]]; then
    file="$HOME/.bash/osx/.profile"
fi

if [[ -e $file ]] ; then
    source $file
#    echo "Custom configuration loaded ($file)"
fi
