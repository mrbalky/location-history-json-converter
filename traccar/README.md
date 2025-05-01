* Add device to traccar. Remember the "unique device id" you used
* Convert location JSON to CSV with full output and unix timestamps (--format csvfullest --unixtimes options)
* Optionally filter out device(s) by Google device tag from the CSV (excludeDevice.sh locations.csv NNNNNN)
  * You can get the device tag from `Settings.json` in the Takeout files
* Run `import-csv-traccar.sh <csv file> <device id>`
