#!/usr/bin/env bash

set -e

# Lists all the icon names for the array in BladeHeroiconsServiceProvider...

HEROICONS=$(cd `dirname $0` && pwd)/../resources/heroicons

for file in $HEROICONS/outline-md/*; do
  filename=${file##*/}

  NAME="'"
  NAME+=$(echo ${filename} | cut -f 1 -d '.' | cut -c 4-)
  NAME+="',"

  echo $NAME
done
