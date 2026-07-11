#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "This script must be run as root."
    exit 1
fi

VALIDATION() {
    if [ $1 -ne 0 ]; then
        echo "$2 installation failed."
        exit 1
    else
        echo "$2 installation successful."
    fi
}
dnf install mysql -y
VALIDATION $? "MySQL"