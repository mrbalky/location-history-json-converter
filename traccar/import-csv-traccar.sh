#!/bin/bash

cat import-csv-traccar.sql \
    | sed "s/\\\$INPUT_FILE/$1/g" \
    | sed "s/\\\$DEVICE_ID/$2/g" \
    | mysql -h localhost -u traccar -p --local-infile=1 traccar

