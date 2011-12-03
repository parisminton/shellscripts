#!/bin/bash

# > float.sh <
# Floating point number functions.

# This code is republished from Linux Journal, July 30, 2008:
# http://www.linuxjournal.com/content/floating-point-math-bash

# It was written by Mitch Frazier (I think) and covered by the GNU Public License, version 2.

#####################################################################
# Default scale used by float functions.

float_scale=2

# Evaluate a floating point number expression.
function float_eval () {
  local stat=0
  local result=0.0
  if [[ $# -gt 0 ]]; then
    result=$(echo "scale=$float_scale; $*" | bc -q 2>/dev/null)
    stat=$?
    if [[ $stat -eq 0  &&  -z "$result" ]]; then stat=1; fi
  fi
  echo $result
  return $stat
}

# Evaluate a floating point number conditional expression.
function float_cond () {
  local cond=0
  if [[ $# -gt 0 ]]; then
    cond=$(echo "$*" | bc -q 2>/dev/null)
    if [[ -z "$cond" ]]; then cond=0; fi
    if [[ "$cond" != 0  &&  "$cond" != 1 ]]; then cond=0; fi
  fi
  local stat=$((cond == 0))
  return $stat
}
