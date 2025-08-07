#!/usr/bin/env bash

# search for project directory
selected=$(find ~ ~/work ~/learning -mindepth 2 -maxdepth 2 -type d | fzf)

# if we did not select a directory then exit
if [[ -z $selected ]]; then
	exit 0
fi

# tr finds characters in input and replaces them with corresponding character of output
# I.E. we replace . with _
session_name=$(basename "$selected" | tr . _)

# check to see if there is a tmux server running
tmux_running=$(pgrep tmux)

# If we are not in tmux ($TMUX is set by tmux when in a session) and tmux isn't running,
# then create a new session and exit
if [[ -z $TMUX ]]; then
	if [[ -z $tmux_running ]] || ! tmux has-session -t "$session_name" 2> /dev/null; then
		tmux new-session -s $session_name -c $selected
	else
		tmux attach-session -t $session_name
	fi
	exit 0
fi

# If there isn't an existing session for what we've selected then create a new detatched session
if ! tmux has-session -t "$session_name" 2> /dev/null; then
# Note: If has-session is running on a session that doesn't exist it will put a message to sout
# we use the 2> to pipe that into the garbage can '/dev/null'
	tmux new-session -s "$session_name" -c "$selected" -d
fi

# Switch to the existing or newly created client
tmux switch-client -t "$session_name"

# Scenarios
#
# Not in tmux && tmux isn't running -> no sessions exist
# Not in tmux && tmux is running && session exists
# Not in tmux && tmux is running && session does not exist
# In tmux && session exists -> tmux is running
# in tmux && session does not exist -> tmux is running


