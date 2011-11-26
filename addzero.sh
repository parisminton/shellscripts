#!/bin/bash

# > addzero.sh <
# Adds a zero before the single digit in file names separated by an underscore.
# Designed to help keep files in sequence in directory listings. Otherwise, you get listings like
# "_0.txt, _1.txt, _10.txt, _11.txt, _12.txt, ..., _2.txt, _20.txt, _21.txt, _22.txt, ..."

# Written by parisminton for Concrete Daydreams.
# <parisminton@da.ydrea.ms>

#vrs="v 0.1"
#last_change="11/25/11"

for filename in $(ls -1 ./*); do
  if [[ $filename =~ _[0-9]\. ]]; then
    new_filename=$(echo $filename | sed -n 's/_\([0-9]\)\./_0\1\./p')
    mv $filename $new_filename
  fi
done
