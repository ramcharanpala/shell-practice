#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
y="\e[33m"
N="\e[0m"
if [ $USERID -ne 0 ]; then
    echo -e "${R}ERROR: This script must be run as root.${N}"
    exit 1
fi

VALIDATION() {
    if [ $1 -ne 0 ]; then
        echo -e "installing $2 .. $R failure $N"
        exit 1
    else
        echo -e "installing $2 .. $G success $N"
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]; then
    dnf install mysql -y 
    VALIDATION $? "MySQL"
else
    echo -e "installing mysql already exists .. $Y SKIPPING $N"
fi

dnf list installed nginx 
if [ $? -ne 0 ]; then
    dnf install nginx -y 
    VALIDATION $? "nginx"
else 
    echo -e "installing nginx already exists ..$Y SKIPPING $N"
fi

dnf list installed python3
if [ $? -ne 0 ]; then 
    dnf install python3 -y 
    VALIDATION $? "python3"
else
    echo -e "installing python3 already exists .. $Y SKIPPING $N"
fi  
  