#!/bin/bash

help()
{
 echo "Function count_str() - returns the number of occurrences of the string in the input stream. The search string is passed as the first parameter. If no parameters - returns the number of rows in the input stream. 
Function readfile() - сuts from the file blank lines and comments. Returns the number of occurrences of the string in the file. File - the first argument of the function, the string - the second."
}


count_str()
{
 withoutArgument=false
 if [ -z "$1" ]
 then
  pattern="\0"
  withoutArgument=true
 else
  pattern=$1
 fi
 #input STOP for finishing
 amount=0
 while read line
 do
  if [ "$line" == "STOP" ]
  then
   break
  fi
  
  line=${line}"\0"
  if { echo $line | grep "$pattern" > /dev/null; }; then
   amount=$(($amount + 1))
  fi
 done <&0
 if $withoutArgument
 then
  echo "Amount of lines in stdin = "$amount
 else
  echo "Amount of '$pattern' in stdin = "$amount
 fi
}

readfile()
{
 if [ $# != 2 ]
 then
  echo "Error! Function readfile() must have 2 parameters"
  exit
 fi
 filename=$1
 if [ -f "$filename" ]
 then
  sed -i "s/#.*$//; /^$/d" $filename 
  count_str $2 < $filename
 else
  echo "File with name '$filename' is not exist."
fi
}
