#!bin/bash

source_dir=/home/ec2-user/logs

if [ -d $source_dir ]
then
  echo "source_dir exit"
else
  echo "source_dir does't exit"
  exit 1
fi

files=$(find $source_dir -name *.log* -mtime +14)
echo "files:$files"

while IFS=read -r file
do
  echo "Deleting line: $file
  rm -rf $file
done <<< files

#IFS,internal field seperatpor, empty it will ignore while space.-r is for not to ingore special 
charecters like /