#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "ERROR: This script must be run as root."
    exit 1
fi

dnf install mysql -y
if [ $? -ne 0 ]; then
    echo "MySQL installation failed."
    exit 1
else
    echo "MySQL installation successful."
fi
