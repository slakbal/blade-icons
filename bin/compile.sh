#!/usr/bin/env bash

set -e

echo "Compiling Blade heroicons..."

DIRECTORY=$(cd `dirname $0` && pwd)
RESOURCES=$DIRECTORY/../resources
HEROICONS=$RESOURCES/heroicons
COMPONENTS=$RESOURCES/views/components

for file in $HEROICONS/outline-md/*; do
  filename=${file##*/}
  name=$(echo ${filename} | cut -f 1 -d '.')

  cp $HEROICONS/outline-md/${name}.svg $COMPONENTS/outline-md/${name}.blade.php

  FIRST_LINE='<svg fill="none" viewBox="0 0 24 24" stroke="currentColor" class="{{ $class ?? null }}">'
  sed -i '' "1s/.*/$FIRST_LINE/" $COMPONENTS/outline-md/${name}.blade.php
done

for file in $HEROICONS/solid-sm/*; do
  filename=${file##*/}
  name=$(echo ${filename} | cut -f 1 -d '.')

  cp $HEROICONS/solid-sm/${name}.svg $COMPONENTS/solid-sm/${name}.blade.php

  FIRST_LINE='<svg viewBox="0 0 20 20" fill="currentColor" class="{{ $class ?? null }}">'
  sed -i '' "1s/.*/$FIRST_LINE/" $COMPONENTS/solid-sm/${name}.blade.php
done

echo "All done!"
