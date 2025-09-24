#!/bin/bashUSERID=$(id -u)

 USERID=$(id -u)
 R="\e[31m"
 G="\e[32m"
 Y="\e[33m"
 N="\e[0m"
 
 if [ $USERID -ne 0]; then
     echo "ERROR:: Please run this script with root privelege"
     exit 1 # failure is other than 0
 fi

 VALIDATE(){
    if [ $? -ne 0]; then
     echo -e "Installing $2...$R is failure $N"
     exit 1
    else    
     echo "Installing $2....$G SUCCESS $N"
    fi    
 }
 dnf list installed mysql
 #Install if it is not found
 if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "Mysql"
 else
    echo -e"Mysql already exist...$G SKIPPING $N"
fi

 dnf list installed nginx
 if [ $? -ne 0 ]; then
   dnf install nginx -y
   VALIDATE $? "Nginx"   
else 
   echo -e"Nginx already exist...$Y SKIPPING $N"  

 dnf list installed python3
 if [ $? -ne 0 ]; then
   dnf install python3 -y
   VALIDATE $? "python3"
 else   
   echo -e "python3 already exist...$G SKIPPING $N"
 fi   