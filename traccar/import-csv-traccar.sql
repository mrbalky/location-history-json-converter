LOAD DATA LOCAL INFILE '$INPUT_FILE'
INTO TABLE traccar.tc_positions
FIELDS
  TERMINATED BY ','
  LINES TERMINATED BY '\n'
IGNORE 1 ROWS (
  @timestamp,
  @deviceTime,
  @serverTime,
  @lat,
  @lon,
  @accuracy,
  @altitude,
  @verticalAccuracy,
  @velocity,
  @heading
) SET
  deviceid=(select id from tc_devices where uniqueid='$DEVICE_ID'),
  servertime=from_unixtime(@serverTime),
  devicetime=from_unixtime(@deviceTime),
  fixtime=from_unixtime(@timestamp),
  valid=1,
  latitude=@lat,
  longitude=@lon,
  altitude=@altitude,
  speed=@velocity,
  course=@heading,
  accuracy=@accuracy,
  attributes=IF(LENGTH(@heading)>0, "{\"motion\":true}", "{}");

