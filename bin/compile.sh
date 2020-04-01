#!/usr/bin/env bash

set -e

echo "Compiling Blade heroicons..."

DIRECTORY=$(cd `dirname $0` && pwd)
RESOURCES=$DIRECTORY/../resources
HEROICONS=$RESOURCES/heroicons
IMAGES=$RESOURCES/images
COMPONENTS=$RESOURCES/views/components

for file in $HEROICONS/outline-md/*; do
  filename=${file##*/}
  destinationName=$(echo ${filename} | cut -c 4-)

  cp $HEROICONS/outline-md/${filename} $IMAGES/icon-o-${destinationName}

  FIRST_LINE='<svg fill="none" viewBox="0 0 24 24" stroke="currentColor" xmlns="http:\/\/www.w3.org\/2000\/svg">'
  sed -i '' "1s/.*/$FIRST_LINE/" $IMAGES/icon-o-${destinationName}
done

for file in $HEROICONS/solid-sm/*; do
  filename=${file##*/}
  destinationName=$(echo ${filename} | cut -c 4-)

  cp $HEROICONS/solid-sm/${filename} $IMAGES/icon-s-${destinationName}

  FIRST_LINE='<svg viewBox="0 0 20 20" fill="currentColor" xmlns="http:\/\/www.w3.org\/2000\/svg">'
  sed -i '' "1s/.*/$FIRST_LINE/" $IMAGES/icon-s-${destinationName}
done

for file in $HEROICONS/outline-md/*; do
  filename=${file##*/}
  destinationName=$(echo ${filename} | cut -f 1 -d '.' | cut -c 4-)

  cp $HEROICONS/outline-md/${filename} $COMPONENTS/icon-o-${destinationName}.blade.php

  FIRST_LINE='<svg fill="none" viewBox="0 0 24 24" stroke="currentColor" class="{{ $class ?? null }}">'
  sed -i '' "1s/.*/$FIRST_LINE/" $COMPONENTS/icon-o-${destinationName}.blade.php
done

for file in $HEROICONS/solid-sm/*; do
  filename=${file##*/}
  destinationName=$(echo ${filename} | cut -f 1 -d '.' | cut -c 4-)

  cp $HEROICONS/solid-sm/${filename} $COMPONENTS/icon-s-${destinationName}.blade.php

  FIRST_LINE='<svg viewBox="0 0 20 20" fill="currentColor" class="{{ $class ?? null }}">'
  sed -i '' "1s/.*/$FIRST_LINE/" $COMPONENTS/icon-s-${destinationName}.blade.php
done

echo "All done!"
