#!/bin/bash

# > harvest.sh <
# Identifies audio CDs and copies their contents to my archive directory
# Written by parisminton for Concrete Daydreams.
# <parisminton@da.ydrea.ms>

vrs='v 0.7'
lastchange='8/15/11'


echo -e "\n--> Harvest $vrs $lastchange <--"

# ...change IFS to newline...
OLD_IFS=$IFS
IFS=$'\n'

i=0

tryagain="\n--> I can't find any more external volumes. Are you sure you inserted a CD or external drive?"

function y_or_n () {
  until [ "$pick" == "y" -o "$pick" == "n" ]; do
    echo -e "--> (Enter \"y\" or \"n\".)\n"
    read pick
  done
}

function collect () {
  the_disc=$1 # is this still necessary?
  multi=null
  ls /Volumes/$1
  echo -e "\n--> What's the artist's name?\n"
  read artist
  echo -e "\n--> OK. We're storing music from $artist."
  
  echo -e "\n--> Is \"$1\" the name of the album?"
  pick=null
  y_or_n
  
  if [ "$pick" == "y" ]; then
    echo -e "\n--> Excellent. $1 is the name of the album by $artist.\n"
    album=$1
  else
    echo -e "\n--> What's the name of the album?\n"
    read album
    echo -e "\n--> Excellent. $album is the name of the album by $artist."
  fi
  
  echo -e "\n--> Is \"$album\" a multi-disc set?"
  pick=null
  y_or_n
  
  if [ "$pick" == "y" ]; then
    echo -e "\n--> Which disc is this? (\"1,\" \"Disc 1,\" \"The Love Below,\" \"etc...)\n"
    read multi
    if [[ "$multi" =~ ^[0-9]+$ ]]; then
      multi="Disc $multi"
    fi
  fi
}

function archive () {
  musicpath="/Volumes/180 gram/Uncompressed/"

  # see if we\'ve already stored this artist...
  if [ ! -e "$musicpath/$artist" ]; then 
    mkdir "$musicpath/$artist"
    echo -e "\n--> I just created a folder named \"$artist.\""
  else
    echo -e "\n--> $artist already has a folder in the archive."
  fi
  cd "$musicpath/$artist"
    
  #see if we\'ve already stored this album...
  if [ ! -e "$musicpath/$artist/$album" ]; then
    mkdir "$musicpath/$artist/$album"
    echo -e "\n--> I just created a folder named \"$album.\""
  else
    echo -e "\n--> The album \"$album\" already has a folder in the archive."
  fi
  cd "$musicpath/$artist/$album"

  #see if we\'ve already stored this disc from the set...
  if [ "$multi" != null ]; then
    if [ ! -e "$musicpath/$artist/$album/$multi" ]; then
      mkdir "$musicpath/$artist/$album/$multi"
      echo -e "\n--> I just created a folder named \"$multi.\""
    else
      echo -e "\n--> \"$multi\" already has a folder in the archive."
    fi
    cd "$musicpath/$artist/$album/$multi"
  fi
  
  mkdir ~/.harvest
  ls -1 . > ~/.harvest/existing
  tracktotal=$(ls -1 /Volumes/$the_disc | grep -cvf ~/.harvest/existing)
  
  if [ $tracktotal -gt 0 ]; then
    open .
    trackcount=0
    for trackname in $(ls -1 /Volumes/$the_disc | grep -vf ~/.harvest/existing); do
      trackcount=$(($trackcount+1))
      echo -e "\n--> Copying \"$trackname.\" This may take a minute or two..."
      cp "/Volumes/$the_disc/$trackname" .
    done
    echo -e "\n--> Finished copying."
    echo -e "\n--> $tracktotal tracks from the album \"$album\" by $artist have been saved to $(pwd)."
  else
    echo -e "\n--> Nothing copied. All the files on $album have already been archived.\n"
  fi
  
  rm -PR ~/.harvest

}

# ...compare the /Volumes list to the pre-defined list of internal volumes
# we know aren\'t the audio CD; any inverse matches are likely to be the
# CD we want to archive...
if [ "$(ls -1 /Volumes | grep -vf ~/.int_vols)" ]; then

  for filename in $(ls -1 /Volumes | grep -vf ~/.int_vols); do
    if [ -d "/Volumes/$filename" ]; then
      fn[$i]=$filename
      i=$(($i+1))
    fi
  done

  if [ ${#fn[*]} -gt 1 ]; then
    echo -e "\n--> I see more than one volume that might contain the music you want to archive:\n"

    PS3="--> Which one do you want? (Type the number of your choice.) "

    select disc in ${fn[*]}; do
      echo -e "\n--> Cool. You selected $disc.\n"
      break
    done
    
    collect $disc
    archive

  else
    echo "\n--> Does the volume named \"${fn[0]}\" contain the music you want to archive?"    
    y_or_n
    if [ "$pick" == "y" ]; then
      collect ${fn[0]}
    else
      echo $tryagain
    fi
  fi

else
  echo $tryagain
fi

# ...restore IFS...
IFS=$OLD_IFS
