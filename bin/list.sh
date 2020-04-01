#!/usr/bin/env bash

set -e

#[ -d "$1" ] || exit

# Lists all the icons names for the array in BladeIconsServiceProvider...

TYPE=$1
ICONS=$(cd `dirname $0` && pwd)/../resources/images/$TYPE
LENGTH=$(expr $(echo -n $TYPE | wc -m) + 1)

for FILE in $ICONS/*; do
  FILENAME=${FILE##*/}

  NAME="'"
  NAME+=$(echo ${FILENAME} | cut -f 1 -d '.' | cut -c $LENGTH-)
  NAME+="',"

  echo $NAME
done
