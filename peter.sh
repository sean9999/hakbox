#!/bin/bash

STARTCOLOR='\[\033[01;31m\]'   
ENDCOLOR="\e[0m"
export PS1="\n\[$STARTCOLOR\]peter \w\n\$ \[$ENDCOLOR\]"
source /etc/environment
