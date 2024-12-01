#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then
  echo "take root access"
  exit 1
fi

dnf list install git

if [ $? -ne ]
then
  echo "git not installed.. going to install"
  dnf install git -y
  if[ $? -ne 0 ]
  then
    echo "git not installed"
  else
    echo "git installed"
  fi
else
  echo "git installed nothind do"
fi    
  