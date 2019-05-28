#!/bin/bash
acmd="$*"

#         0           1            2         3          4           5            6         7         8            9
dirarray=(chsev.fear  chsev.happy  dep.fear  dep.happy  eptot.fear  eptot.happy  gad.fear  gad.happy socanx.fear  socanx.happy)

for dir in ${dirarray[@]}; do
	cd $dir/$dir
	pwd
	echo "Running: $acmd"
	$acmd
	cd ../..
done
