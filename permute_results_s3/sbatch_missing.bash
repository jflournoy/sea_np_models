#!/bin/bash
#usage: bash script.bash missing.numbers command

sbatch --array=`tr "\n" "," < "${1}"` "${2}"
