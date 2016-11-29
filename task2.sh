#!/bin/bash

if [ $# -ne 2 ]
then
 echo "Function must have a 2 parameter. hint: print parameter -f [namefile]"
 exit
fi
while getopts "f:" opt
do
case $opt in
f) namefile=$OPTARG
 source ./lib.sh
 readfile $namefile tcp
 readfile $namefile udp
 exit
;;
esac
done

echo "hint: print parameter -f [namefile]"
exit 0
