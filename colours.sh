#!/bin/bash

userid=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

check_root(){
   if [ $userid -ne 0 ]
   then
     echo "take root access"
     exit 1
   fi
}

validate(){
    if [ $? -ne 0 ]
    then
      echo "filure"
    else
      echo "succuss"
    fi    
}

dnf list installed git

if [ $? -ne 0 ]
then
  echo "git not installed.. going to install"
  dnf install git -y
  validate $?
else
  echo -e "git installed nothind do..$R"
fi    
  
check_root

dnf list installed mysql

if [ $? -ne 0 ]
then
  echo "going to install"
  dnf install mysql -y
  validate $?
else
  echo -e "mysql installed nothing do..$G"
fi