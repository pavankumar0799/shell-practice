#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then
  echo "take root access"
  exit 1
fi

dnf list installed git

if [ $? -ne 0 ]
then
  echo "git not installed.. going to install"
  dnf install git -y
  if [ $? -ne 0 ]
  then
     echo "git not installed"
     exit 1
  else
     echo "git installed"
  fi
else
  echo "git installed nothind do"
fi    
  

dnf list installed mysql

if [ $? -ne 0 ]
then
  echo "going to install"
  dnf install mysql -y
  if [ $? -ne 0 ]
  then
    echo "install mysql"
  else
    echo "not installed"
  fi
else
  echo "mysql installed nothing do"
fi