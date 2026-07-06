#!/bin/bash

echo "all variables passed to the script: $@"
echo "all variables passed to the script: $*"
echo "script name: $0"
echo "current directory: $PWD"
echo "who is running the script: $USER"
echo "home directory of the user: $HOME"
echo "PID of the script: $$"
sleep 5000 &
echo "PID of the last background process: $!"