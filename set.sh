#!/bin/bash

set -e
#set -ex --> showing more information

faiure(){
    echo "failed at $1:$2"
}

trap 'failure "${line number}" "${bash command}"' err
echo "this is success"
echooo "this is failure"
echo "this is success"