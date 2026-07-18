#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "script execution started at: $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then
    echo -e "${R}ERROR: This script must be run as root.${N}"
    exit 1
fi

VALIDATION(){
    if [ $1 -ne 0 ]; then
        echo -e "installing $2 .. $R failure $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "installing $2 .. $G success $N"| tee -a $LOG_FILE
    fi
}

for package in $@
do 
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]; then 
        dnf install $package -y &>>$LOG_FILE 
        VALIDATION $? "$package"
    else
        echo -e "installing $package already exists .. $Y SKIPPING $N" | tee -a $LOG_FILE 
    fi
done
