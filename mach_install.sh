#!/bin/bash

if [ -f ".secrets.gpg" ]
then
	PASSWORD=`gpg -d .secrets.gpg`		# for encrypted password storage
elif [ -f ".secrets" ]
then
	PASSWORD=`cat .secrets`			# for unencrypted password storage
else
	echo No .secrets or .secrets.gpg found!
	exit 1
fi

readarray machines < .machines
prog=$1

mach_size=${#machines[@]}

# if this signal is not caught it is impossible
# to kill the program without using kill -15 $pid.
trap "exit 0" SIGINT

counter=0

# loop until all of the machines have been ssh'ed into.
while [ 1 ]; do

  for ((i = 0 ;i < $mach_size;i++)); do
    if [ ! -z "${machines[$i]}" ]
      then 
	# parentheses surrounding a command open a subshell
	# the ret val of subshell can be seen in $? as usual
	(./expect_install.sh $1 ${machines[$i]} $PASSWORD)
	if [ $? -eq 0 ]; then counter=$((counter+1)); unset machines[$i]; fi
	if [ $counter -ge $mach_size ]; then exit; fi
    fi
  done
done
