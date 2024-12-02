#!/min/bash

#following this order --/var/log/shell_script/redirections.sh(file_name)-<timestamp>.log

logs_folder="/var/log/shell_script"

script_name=$(echo $0 | cut -d "." -f1)
timestamp =$(date +%Y-%m-%d-%H-%M-%S)
log_file="$logs_folder/$script_name-$timestamp.log"
mkdir -p $logs_folder

userid=$(id -u)

check_root(){
if [ $userid -ne 0 ]
then
  echo "please take root access" | tee -a $log_file
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

echo "Script started executing at: $(date)" | tee -a $log_file

for package in $@ #taking all agruments
do
  dnf list installed $package | tee -a $log_file
  if [ $? -ne 0 ]
  then
    echo "going to install"
    dnf install $package -y
    validate $?
  else
    echo "installed nothing to do" | tee -a $log_file
  fi
done      
