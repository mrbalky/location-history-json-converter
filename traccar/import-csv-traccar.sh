#!/bin/bash

if [ $# -ne 2 ]; then
  echo "USAGE:
  $(basename $0) <csv file> <device tag>
  "
  exit 1
fi

# TODO: Fix this sed stuff so a real input file with path can be used
cat import-csv-traccar.sql \
    | sed "s/\\\$INPUT_FILE/$1/g" \
    | sed "s/\\\$DEVICE_TAG/$2/g" \
    | mysql -h localhost -u traccar -p --local-infile=1 traccar

