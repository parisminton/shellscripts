#!/bin/bash

# > smart_open.sh <
# Syntactic sugar on top of bash find for opening multiple files with similar properties in various applications.

# Written by parisminton for Concrete Daydreams.
# <parisminton@da.ydrea.ms>

#vrs="v 0.1"
#last_change="10/15/11"

function smart_open () {
  OLD_IFS=$IFS
  IFS=$(echo -en "\n\b") # new separator is newline followed by backspace...
  arg_array=( )
  app=""
  mod=""
  dir=$PWD
  dur="-5m"
  ftype="f"
  find_stuff=false
  for arg in $*; do 
    if [[ $arg =~ \.app$ || -L $arg ]]; then
      mod="-a"
      app=$arg
      continue
    fi
    if [[ -d $arg ]]; then
      find_stuff=true
      dir=$arg
      continue
    fi
    if [[ $arg =~ -[0-9][0-9]*[smhdw]$ ]]; then
      find_stuff=true
      dur=$arg
      continue
    fi
    if [[ $arg =~ ^[fdl]$ ]]; then
      find_stuff=true
      ftype=$arg
      continue
    fi
    arg_array[${#arg_array[@]}]=$arg
  done 
  
  if [[ $find_stuff == true ]]; then
    # echo "The parameter string is: ${parameters[*]}" 
    find $dir/* -mtime $dur -type $ftype -exec open $mod $app {} \;
  else
    open $mod $app ${arg_array[*]}
  fi
  IFS=$OLD_IFS
}
