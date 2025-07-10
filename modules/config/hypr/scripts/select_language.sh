#!/bin/bash

# 最初の引数としてFIFOのパスを受け取る
FIFO_PATH="$1"

if [ -z "$FIFO_PATH" ]; then
    echo "Error: FIFO path not provided." > /dev/stderr
    notify-send "Error" "FIFO path missing in select_language.sh"
    exit 1
fi

# あなたのスクリプトから抜粋した言語選択部分
echo "1) Japanese (ja)"
echo "2) English  (en)"
echo "3) Thai     (th)"
read -p "Enter number (Default=1): " CHOICE

case "$CHOICE" in
    1) SELECTED_LANG="ja" ;;
    2) SELECTED_LANG="en" ;;
    3) SELECTED_LANG="th" ;;
    *)
      echo "Invalid choice. Defaulting to Japanese (ja)." > /dev/stderr
        SELECTED_LANG="ja" # 無効な場合は空を返す
        ;;
esac

echo "$SELECTED_LANG" > "$FIFO_PATH" # 選択された言語をFIFOに書き込む
exit 0
