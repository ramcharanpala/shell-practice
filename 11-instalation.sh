#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "This script must be run as root."
    exit 1
fi

dnf install mysql -y
if [ $? -eq 0 ]; then
    echo "MySQL installation successful."
else
    echo "MySQL installation failed."
    exit 1
fi