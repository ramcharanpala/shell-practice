#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "ERROR: This script must be run as root."
    exit 1
fi

validation() {
    if [ $1 -ne 0 ]; then
        echo "$2 installation failed."
        exit 1
    else
        echo "$2 installation successful."
    fi
}

dnf install mysql -y
validation $? "MySQL"

dnf install nginx -y
validation $? "Nginx"

dnf install python3 -y
validation $? "Python3"

