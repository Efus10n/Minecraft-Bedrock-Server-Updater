#!/bin/bash

MCDIR=/home/rjohn/minecraft_bedrock

tmux new-session -s minecraft_bedrock -d
sleep 1
tmux send-keys -t minecraft_bedrock "cd ${MCDIR}/current" Enter
sleep 1
tmux send-keys -t minecraft_bedrock 'LD_LIBRARY_PATH=. ./bedrock_server' Enter

echo "server turned on"
