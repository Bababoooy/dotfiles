#!/bin/bash
battery_level=`cat /sys/class/power_supply/BAT0/capacity`
if [ $battery_level -lt 15 ]
then
  notify-send -h  string:fgcolor:#ff4444 -i ~/.scripts/battery/icon.png "Battery low" "Battery level is below 15%"
fi
userid=$(id -u)
DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$userid/bus"
export DBUS_SESSION_BUS_ADDRESS
