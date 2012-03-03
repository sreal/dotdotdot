#!/bin/bash
#
# For the platform, 
# Copy the appropriate file into the home directory
# Backup current config


clear 
## ## ## ## ## ## ## ##
platform=$(uname)

home="$HOME/"
backupdir=$HOME"/backup"
dirlist=".bash"
filelist=".bash_profile .bashrc .profile"


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
