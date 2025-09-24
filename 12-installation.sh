#!/bin/bash

 USERID=$(id -u)

 if [ $USERID -ne 0]; then
     echo "ERROR:: Please run this script with root privelege"
 fi

 dnf install mysql -y

 if [ $? -ne 0]; then
     echo "ERROR:: Installing Myqsl is failure"
 else    
     echo "Installing MysqL is SUCCESS"
 fi    
        