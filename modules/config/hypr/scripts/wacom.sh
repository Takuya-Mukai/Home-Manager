#!/bin/bash

STATEFILE="/tmp/wacom_toggle_state"

if [ ! -f "$STATEFILE" ]; then
  echo "1" > "$STATEFILE"
fi

STATE=$(cat "$STATEFILE")

if [ "$STATE" = "1" ]; then
  swaymsg input "1386:827:Wacom_Intuos_S_2_Pen" map_to_region 0 1145 1080 675
  echo "2" > "$STATEFILE"
  echo "write 2 to $STATEFILE"
else
  swaymsg input "1386:827:Wacom_Intuos_S_2_Pen" map_to_region 1080 420 1728 1080
  echo "1" > "$STATEFILE"
  echo "write 1 to $STATEFILE"
fi

swaymsg input "1386:827:Wacom_Intuos_S_2_Pen" rotation_angle 270
