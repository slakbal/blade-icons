#!/usr/bin/env bash

set -e

DIRECTORY=$(cd `dirname $0` && pwd)
RESOURCES=$DIRECTORY/../resources
IMAGES=$RESOURCES/images
COMPONENTS=$RESOURCES/views/components

echo "Compiling Heroicons..."

for FILE in $RESOURCES/heroicons/outline-md/*; do
  FILENAME=${FILE##*/}

  # Compile raw outline icons...
  RAW=$IMAGES/heroicons/heroicon-o-$(echo ${FILENAME} | cut -c 4-)

  cp $FILE $RAW

  FIRST_LINE='<svg fill="none" viewBox="0 0 24 24" stroke="currentColor" xmlns="http:\/\/www.w3.org\/2000\/svg">'
  sed -i '' "1s/.*/$FIRST_LINE/" $RAW

  # Compile outline components...
  BLADE=$COMPONENTS/heroicons/heroicon-o-$(echo ${FILENAME} | cut -f 1 -d '.' | cut -c 4-).blade.php

  cp $FILE $BLADE

  FIRST_LINE='<svg fill="none" viewBox="0 0 24 24" stroke="currentColor" class="{{ $class ?? null }}">'
  sed -i '' "1s/.*/$FIRST_LINE/" $BLADE
done

for FILE in $RESOURCES/heroicons/solid-sm/*; do
  FILENAME=${FILE##*/}

  # Compile raw solid icons...
  RAW=$IMAGES/heroicons/heroicon-s-$(echo ${FILENAME} | cut -c 4-)

  cp $FILE $RAW

  FIRST_LINE='<svg viewBox="0 0 20 20" fill="currentColor" xmlns="http:\/\/www.w3.org\/2000\/svg">'
  sed -i '' "1s/.*/$FIRST_LINE/" $RAW

  # Compile solid components...
  BLADE=$COMPONENTS/heroicons/heroicon-s-$(echo ${FILENAME} | cut -f 1 -d '.' | cut -c 4-).blade.php

  cp $FILE $BLADE

  FIRST_LINE='<svg viewBox="0 0 20 20" fill="currentColor" class="{{ $class ?? null }}">'
  sed -i '' "1s/.*/$FIRST_LINE/" $BLADE
done

echo "Compiling Zondicons..."

for FILE in $RESOURCES/zondicons/*; do
  FILENAME=${FILE##*/}

  if [ "$FILENAME" == ".gitignore" ]
  then
    break
  fi

  # Compile raw icons...
  cp $FILE $IMAGES/zondicons/zondicon-${FILENAME}

  # Compile components...
  DESTINATION=$COMPONENTS/zondicons/zondicon-$(echo ${FILENAME} | cut -f 1 -d '.').blade.php

  cp $FILE $DESTINATION

  CLASS='<svg fill="currentColor" class="{{ $class ?? null }}"'
  sed -i '' "s/<svg/$CLASS/" $DESTINATION
done

echo "All done!"
