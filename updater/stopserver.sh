#!/bin/bash

checkserver=$(tmux ls | grep 'minecraft_bedrock')
if [ -z "$checkserver" ]; then
	echo "Server is already off"
	exit
fi

tmux send-keys -t minecraft_bedrock Enter
tmux send-keys -t minecraft_bedrock Enter

# Notice users that server will shutdown
#tmux send-keys -t minecraft_bedrock 'tellraw @a {"rawtext":[{"text":"server will shutdown"}]}' Enter
#tmux send-keys -t minecraft_bedrock Enter
#tmux send-keys -t minecraft_bedrock Enter

tmux send-keys -t minecraft_bedrock 'stop' Enter
sleep 60
tmux send-keys -t minecraft_bedrock 'exit' Enter
sleep 1
echo "server successfully turned off"
