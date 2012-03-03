#!/bin/bash
#
# Load the global .profile
# Then the specific platform


## ## ## ## ## ## ## ##
# GLOBAL CONFIGURATION (across boxes) 
# 




## ## ## ## ## ## ## ##
# SOURCE PLATFORM SPECIFIC 
# Get the platform's .bashrc source
platform = $(uname)
if   [[ "$platform" == 'Linux' ]]; then
    file="~/.bash/linux/.profile"
elif [[ "$platform" == 'MIGW32_NT-6.1' ]]; then
    file="~/.bash/windows/.profile"
elif [[ "$platform" == 'Darwin' ]]; then
    file="~/.bash/osx/.profile"
fi
if [[ -e $(file) ]] ; then 
    source $(file)
else
    #echo "File Not Found ($(file))
fi
