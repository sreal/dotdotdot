#!/bin/bash
#
# For the platform,
# Copy the appropriate file into the home directory
# Backup current config

platform=$(uname)


home="$HOME/"
backupdir=$HOME"/backup/"
dirlist=".bash"
filelist=".bash_profile .bashrc .profile .gitconfig"


## ## ## ## ## ##
## Common files
for dir in $dirlist; do
  orig=$home$dir
  backup=$backupdir$dir
  if [ ! -d $orig ]; then
    echo $orig not found. no backup required
  else
    echo $orig exists. backed up to $backup
    cp -r $orig $backup
  fi

  if [ ! -d "$dir" ]; then
    echo $file not found. no copy possible
  else
    cp -r $dir $home
    echo $dir copied to $home
  fi
done

for file in $filelist; do
  orig=$home$file
  backup=$backupdir$file
  if [ ! -e "$orig" ]; then
    echo $orig not found. no backup required
  else
    echo $orig exists. backed up to $backup
    cp $orig $backup
  fi

  if [ ! -e "$file" ]; then
    echo $file not found. no copy possible
  else
    cp $file $home
    echo $file copied to $home
  fi
done

## ## ## ## ## ##
## Application Specific
function include_if_app_exists
{

  app=$1
  file=$2
  dest=$3
  isDir=$4


  orig=$home$file
  backup=$backupdir$file
  if [ ! -e $orig ]; then
    echo $orig not found. no backup required
  else
    echo $orig exists. backed up to $backup
    cp -r $orig $backup
  fi

  #assumes file exists
  found=1
  command -v $app   &>/dev/null || { found=0 >&2; }

  # 0 - not found, 1 - found
  if [ $found == 0 ] ; then
    #try osx application
    echo "/Applications/$app.app"
    if [ -d "/Applications/$app.app" ]; then
      found=1
    fi
  fi

  if [ $found == 1 ] ; then

    if [ ! -e "$file" ]; then
      echo $file not found
    else
      if [ ! -d "$file" ]; then
        cp $file $dest
      else
        cp -R $file $dest
      fi
      echo $file copied to $dest
    fi
  else
    echo "Application not found ($app)"
  fi
}

include_if_app_exists vim ./.vimrc $home
include_if_app_exists emacs ./.emacs $home
include_if_app_exists emacs ./.emacs.d $home
include_if_app_exists conky ./.conkyrc $home
include_if_app_exists Slate ./.bash/osx/.slate $home
