#!/bin/bash

if [ $# -lt 4 ]
then
 echo "Few arguments!"
 exit
fi

while getopts "f:l:a" opt
do
case $opt in
 f) nameFile=$OPTARG;;
 l) line=$OPTARG;;
 a) check=1;;
esac
done

if [ "$nameFile" -a "$line" ]
then
 if [ "$check" == 1 ]
 then 
  cat /dev/null > $nameFile
 fi
 echo "$(date +"%T")" $line >> $nameFile
else
 echo "You have not entered arguments -f and(or) -l "
fi
