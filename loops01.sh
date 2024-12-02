#!/bin/bash

userid=$(id -u)

check_root(){
if [ $userid -ne 0 ]
then
  echo "please take root access"
  exit 1
fi
}

validate(){
    if [ $? -ne 0 ]
    then
      echo "failure"
    else
      echo "success"
    fi  
}

check_root

for package in $@ #taking all agruments
do
  dnf list installed $package
  if [ $? -ne 0 ]
  then
    echo "going to install"
    dnf install $package -y
    validate $?
  else
    echo "installed nothing to do"
  fi
done      

# installing packages(git,mysql,nginx...)using loops
#variables given through the arguments like sh file_name git mysql nginx ..

