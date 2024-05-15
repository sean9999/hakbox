#!/bin/bash

SESSION_NAME="disciples"

if tmux -2 -u has-session -t $SESSION_NAME 2>/dev/null; then
    tmux -2 -u attach-session -t $SESSION_NAME
else
    tmux -2 -u new-session -d -s $SESSION_NAME
    tmux -2 -u split-window -h
    tmux -2 -u send-keys -t 1 'cd /root/peter && bash --rcfile .bashrc' C-m C-l
    tmux -2 -u send-keys -t 2 'cd /root/paul && bash --rcfile .bashrc' C-m C-l
    tmux -2 -u attach-session -t $SESSION_NAME
fi
