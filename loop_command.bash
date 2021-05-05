#!/bin/bash
acmd="$*"

dirarray=($(cat dirlist.txt))

if [ -z "$dirarray" ]
then
	echo "Variable 'dirarray' is not set, aborting...'"
	exit
else
	for dir in ${dirarray[@]}; do
		cd $dir
		pwd
		echo "Running: $acmd"
		$acmd
		cd -
	done
fi
