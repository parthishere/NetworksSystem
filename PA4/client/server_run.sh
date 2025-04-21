#!/bin/sh

nc -l localhost 8000 &
nc -l localhost 8001 &
nc -l localhost 8002 &
nc -l localhost 8003 &

ps -aux | grep "localhost 800"