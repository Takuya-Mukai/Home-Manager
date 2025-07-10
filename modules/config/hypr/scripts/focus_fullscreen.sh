#!/bin/bash
swaymsg [con_id=$(swaymsg -t get_tree | jq '.. | select(.focused? == true and (.class != "obsidian" or .floating == "auto_off")) | .id')] fullscreen toggle
