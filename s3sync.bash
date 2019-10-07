#!/bin/bash
direction="${1}"
dirarray=($(cat "${2}"))
otherargs=""
#otherargs="--dryrun"
localdir="/net/holynfs01/srv/export/mclaughlin/share_root/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint"
s3dir="s3://permutation-cluster"

if [ -z "$dirarray" ]
then
	echo "Variable 'dirarray' is not set, aborting...'"
	exit
else
	if [ "${direction}" = "up" ]
	then
		for dir in ${dirarray[@]}; do
			aws s3 sync ${otherargs} ${localdir}/${dir} ${s3dir}/${dir}
		done
	elif [ "${direction}" = "down" ]
	then
		for dir in ${dirarray[@]}; do
                        aws s3 sync ${otherargs} ${s3dir}/${dir} ${localdir}/${dir}
                done
	fi
fi
