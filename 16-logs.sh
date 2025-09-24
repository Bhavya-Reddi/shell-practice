#!/bin/bash

 USERID=$(id -u)
 R="\e[31m"
 G="\e[32m"
 Y="\e[33m"
 N="\e[0m"
 mkdir -p $LOGS_FOLDER
 LOGS_FOLDER="/var/log/shell-script"
 SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
 LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

 echo " script startre executed at: $(date)
 if [ $USERID -ne 0]; then
     echo "ERROR:: Please run this script with root privelege"
     exit 1 # failure is other than 0
 fi

 
