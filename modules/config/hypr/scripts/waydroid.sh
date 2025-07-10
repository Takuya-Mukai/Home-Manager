#!/bin/bash

# Swayのworkspace10に移動
swaymsg workspace 10

# Waydroidがすでに起動しているか確認
if pgrep -x "waydroid" > /dev/null; then
    # Waydroidが既に起動していれば、フルUIを表示
    waydroid show-full-ui &
    # 起動済み通知
    swaymsg -t command 'notification "Waydroid is already running. Showing full UI."'
else
    if pgrep -x "waydroid" > /dev/null; then
        # WaydroidのフルUIを表示
        waydroid show-full-ui &

        # 起動成功時、通知を表示
        swaymsg -t command 'notification "Waydroid has started successfully with full UI in portrait mode."'
    else
        # 起動失敗時、通知を表示
        swaymsg -t command 'notification "Failed to start Waydroid!"'
    fi
fi
