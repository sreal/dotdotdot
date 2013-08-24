#!/bin/bash
#

source /usr/share/emacs/22.1/etc/emacs.bash
export EDITOR=edit

# Setting PATH for Python 3.1
# The orginal version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.1/bin:${PATH}"
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

# MacPorts Installer addition on 2010-09-14_at_18:16:29: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# Finished adapting your PATH environment variable for use with MacPorts.
export PYTHONPATH=/Library/Frameworks/Python.framework/Versions/2.7/lib/python.2.7/site-packages
