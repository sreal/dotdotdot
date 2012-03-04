#!/bin/bash
#
# Custom configuration for windows boxes


#-------------------------------------------------------------
# Override Shell Prompt (no uptime)
#-------------------------------------------------------------
if [[ "${DISPLAY%%:0*}" != "" ]]; then  
    HILIT=${red}   # remote machine: prompt will be partly red
else
    HILIT=${cyan}  # local machine: prompt will be partly cyan
fi
#  --> Replace instances of \W with \w in prompt functions below
#+ --> to get display of full path name.
function fastprompt()
{
    unset PROMPT_COMMAND
    case $TERM in
        *term | rxvt )
            PS1="${HILIT}[\h]$NC \W > \[\033]0;\${TERM} [\u@\h] \w\007\]" ;;
        linux )
            PS1="${HILIT}[\h]$NC \W > " ;;
        *)
            PS1="[\h] \W > " ;;
    esac
}
_powerprompt()
{
    #LOAD=$(uptime|sed -e "s/.*: \([^,]*\).*/\1/" -e "s/ //g")
}
function powerprompt()
{
    PROMPT_COMMAND=_powerprompt
    case $TERM in
        *term | rxvt  )
            PS1="${HILIT}[\A - \$LOAD]$NC\n[\u@\h \#] \W > \
                 \[\033]0;\${TERM} [\u@\h] \w\007\]" ;;
        linux )
            PS1="${HILIT}[\A - \$LOAD]$NC\n[\u@\h \#] \W > " ;;
        * )
            PS1="[\A - \$LOAD]\n[\u@\h \#] \W > " ;;
    esac
}
powerprompt     # This is the default prompt -- might be slow.
                # If too slow, use fastprompt instead. ...
#-------------------------------------------------------------
if [[ "${DISPLAY%%:0*}" != "" ]]; then  
    HILIT=${red}   # remote machine: prompt will be partly red
else
    HILIT=${cyan}  # local machine: prompt will be partly cyan
fi
#  --> Replace instances of \W with \w in prompt functions below
#+ --> to get display of full path name.
function fastprompt()
{
    unset PROMPT_COMMAND
    case $TERM in
        *term | rxvt )
            PS1="${HILIT}[\h]$NC \W > \[\033]0;\${TERM} [\u@\h] \w\007\]" ;;
        linux )
            PS1="${HILIT}[\h]$NC \W > " ;;
        *)
            PS1="[\h] \W > " ;;
    esac
}
_powerprompt()
{
    LOAD=$(uptime|sed -e "s/.*: \([^,]*\).*/\1/" -e "s/ //g")
}
function powerprompt()
{
    PROMPT_COMMAND=_powerprompt
    case $TERM in
        *term | rxvt  )
            PS1="${HILIT}[\A - \$LOAD]$NC\n[\u@\h \#] \W > \
                 \[\033]0;\${TERM} [\u@\h] \w\007\]" ;;
        linux )
            PS1="${HILIT}[\A - \$LOAD]$NC\n[\u@\h \#] \W > " ;;
        * )
            PS1="[\A - \$LOAD]\n[\u@\h \#] \W > " ;;
    esac
}
powerprompt     # This is the default prompt -- might be slow.
                # If too slow, use fastprompt instead. ...
				
				
#-------------------------------------------------------------
# Program list specific to the machine
#-------------------------------------------------------------
alias notepad='/c/Program\ Files\ \(x86\)/Notepad++/notepad++.exe'