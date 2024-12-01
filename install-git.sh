#!/bin/bash

userid=$(id -u)

if [  $userid -ne 0 ]
then 
  echo "take root user access"
  exit 1
else
  echo "don't take root access"
fi
dnf install git -y

if [ $? -ne 0 ]
then
  echo "git not installed"
else 
  echo "git installed"
fi

