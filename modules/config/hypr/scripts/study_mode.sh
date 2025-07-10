#!/bin/bash

# 勉強時間を入力させる (時間単位)
read -p "How many hours will you focus? " hours
read -p "How many minutes will you focus? " minutes

# 入力の検証
if ! [[ "$hours" =~ ^[0-9]+$ ]] || ! [[ "$minutes" =~ ^[0-9]+$ ]]; then
  notify-send "Focus Mode" "Invalid input. Please enter valid numbers for hours and minutes."
  exit 1
fi

# 合計の秒数を計算
total_seconds=$((hours * 3600 + minutes * 60))

# Study Mode に切り替え
swaymsg mode "focus"

# アプリケーションとワークスペースの対応
declare -A apps=(
    # ["pomodorolm"]="7"
    # ["saber"]="1"
    # ["org.kde.polkit-kde-authentication-agent-1"]="5"
    ["com.github.iwalton3.jellyfin-media-player"]="8"
    ["obsidian"]="7"
)

# アプリケーションの起動コマンド名の対応
declare -A app_exec=(
    # ["pomodorolm"]="pomodorolm"
    # ["saber"]="saber"
    # ["org.kde.polkit-kde-authentication-agent-1"]="input-remapper-gtk"
    ["com.github.iwalton3.jellyfin-media-player"]="jellyfinmediaplayer"
    ["obsidian"]="obsidian"
)

# 各アプリケーションに対して処理を行う
for app in "${!apps[@]}"; do
  workspace="${apps[$app]}"
  exec_name="${app_exec[$app]}" # 起動コマンド名を取得

  # jq の実行結果を変数に格納し、エラーメッセージを除外する
  if swaymsg -t get_tree | jq -e 'recurse(.nodes[]?, .floating_nodes[]?) | select(.app_id == "'"$app"'" or .scratchpad_state == "hidden")' > /dev/null; then
    # アプリが既に起動している場合
    if [[ "$app" == "obsidian" ]]; then
      swaymsg "[app_id=\"$app\"] move container to workspace number $workspace"
      swaymsg "[app_id=\"$app\"] floating disable"
    elif [[ "$app" == "com.github.iwalton3.jellyfin-media-player" ]]; then
      swaymsg "[app_id=\"$app\"] move container to workspace number $workspace"
      swaymsg "[app_id=\"$app\"] floating disable"
      notify-send "Focus Mode" "jellyfin has been floating disabled"
    else
      swaymsg "[app_id=\"$app\"] move container to workspace number $workspace"
    fi
    echo "Info: $app is already running and moved to workspace $workspace."
  else
    # アプリが起動していない場合
    echo "Warning: $app is not running. Starting $exec_name..."
    swaymsg "exec $exec_name"
    sleep 1

    # 起動後にワークスペースに移動
    if [[ "$app" == "obsidian" ]]; then
      swaymsg "[app_id=\"$app\"] move container to workspace number $workspace"
      swaymsg "[app_id=\"$app\"] floating disable"
    elif [[ "$app" == "com.github.iwalton3.jellyfin-media-player" ]]; then
      swaymsg "[app_id=\"$app\"] move container to workspace number $workspace"
      swaymsg "[app_id=\"$app\"] floating disable"
      swaymsg "[app_id=\"$app\"] fullscreen disable"
    else
      swaymsg "[app_id=\"$app\"] move container to workspace number $workspace"
    fi

    echo "Info: $app started and moved to workspace $workspace."
  fi
done

swaymsg "[app_id=\"floating-study-terminal\"] move scratchpad "

notify-send "Focus Mode" "During ${hours} hour(s) and ${minutes} minute(s), key bindings are disabled."
# 指定時間待機
sleep "$total_seconds"

# デフォルトモードに戻す
swaymsg mode "default"
notify-send "Focus Mode" "It's time to relax!"

exit 0
