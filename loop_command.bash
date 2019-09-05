#!/bin/bash
acmd="$*"

dirarray=($(find `pwd -P` -maxdepth 2 -regex '.*\(fear\|happy\)/\(panas\|chavg\)\(pos\|neg\)*\(_lead\)*\.\(fear\|happy\)'|sort))

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
