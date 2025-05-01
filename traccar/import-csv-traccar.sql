LOAD DATA LOCAL INFILE '$INPUT_FILE'
INTO TABLE traccar.tc_positions
FIELDS
  TERMINATED BY ','
  LINES TERMINATED BY '\n'
IGNORE 1 ROWS (
  @timestamp,
  @lat,
  @lon,
  @accuracy,
  @altitude,
  @verticalAccuracy,
  @velocity,
  @heading,
  @detectedActivities,
  @unknown,
  @still,
  @tilting,
  @onFoot,
  @walking,
  @running,
  @inVehicle,
  @onBicycle,
  @inRoadVehicle,
  @inRailVehicle,
  @inTwoWheeler,
  @inFourWheeler,
  @deviceTime,
  @serverTime,
  @deviceTag
) SET
  -- TODO: Some kind of option to use the device tag in the CSV
  deviceid=(select id from tc_devices where uniqueid='$DEVICE_TAG'),
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
  -- TODO: Use the activity data somehow
  attributes=IF(LENGTH(@heading)>0, "{\"motion\":true}", "{}");

