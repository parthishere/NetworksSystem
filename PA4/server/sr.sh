#!/bin/sh
gnome-terminal --title="server 1" --command="bash -c './dfs ./dfs1 8000; $SHELL'"
gnome-terminal --title="server 2" --command="bash -c './dfs ./dfs2 8001; $SHELL'"
gnome-terminal --title="server 3" --command="bash -c './dfs ./dfs3 8002; $SHELL'"
gnome-terminal --title="server 4" --command="bash -c './dfs ./dfs4 8003; $SHELL'"


ps -aux | grep "./dfs"

if [ $1 == 1 ]; then
    kill $(pidof ./dfs)
fi