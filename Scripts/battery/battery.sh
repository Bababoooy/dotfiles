#!/bin/bash

battery_state=`acpi - b | grep "Battery 0" | awk '{print $3}' | sed 's/.$//'`
battery_level=`acpi - b | grep "Battery 0" | awk -F "," '{print $2}' | sed 's/.$//'`

if [[ $battery_state == "Discharging" ]]
then
  if [[ $battery_level < 15 ]]
  then
    notify-send -h  string:fgcolor:#ff4444 -i ~/.scripts/battery/icon.png "Battery low" "Battery level is${battery_level}%"
  fi
fi

userid=$(id -u)
DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$userid/bus"
export DBUS_SESSION_BUS_ADDRESS

## crontab -e command
## " */5 * * * *  XDG_RUNTIME_DIR=/run/user/$(id -u) ~/.scripts/battery/battery.sh "
