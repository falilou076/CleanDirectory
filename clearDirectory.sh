#!/bin/sh

directory = /etc/test/

#move on directory
cd $directory

#Variables
limit=10
array1=($(ls -d */))
array2=($(ls -c1 | head -100))
length=${#array1[@]}
start=$(($length-1))
#freeSpace=$(df -Pk . | sed 1d | grep -v used | awk '{ print $4 "\t" }')

#Execution

if [[ "${array1[*]}" =~ "current/" ]]
then
    if [[ $start -gt $limit ]]
    then
        echo "start process"
        for(( i=$start; i>$limit; i-- ))
        do
            #sudo rm -rf "${array2[i]}"
            echo "${array2[i]} deleted!"
        done
        echo "sucessfull"
    else
        echo "Number of directories: $start is less than $limit"
    fi
else 
    if [[ $length -gt $limit ]]
    then
        echo "start process"
        for(( i=$start; i>=$limit; i-- ))
        do
            #sudo rm -rf "${array2[i]}"
            echo "${array2[i]} deleted!"
        done
        echo "sucessfull"
    else
        echo "Number of directories: $length is less than $limit"
    fi
fi