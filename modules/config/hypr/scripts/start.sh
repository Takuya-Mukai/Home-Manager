#!/bin/bash

# ホスト名を取得
hostname=$(cat /etc/hostname)

# ホスト名が archdesk の場合
if [ "$hostname" = "archdesk" ]; then
    # Hyprlandではワークスペースに移動し、その後にアプリを実行するのが一般的です。
    hyprctl dispatch workspace 10
    hyprctl dispatch exec foot

    hyprctl dispatch workspace 4
    hyprctl dispatch exec zen-browser

    sleep 1 # アプリケーション起動のための短い遅延

    hyprctl dispatch workspace 1
    hyprctl dispatch exec jellyfinmediaplayer
    # gtk-launchはHyprlandでも動作するはずです。
    hyprctl dispatch exec gtk-launch chrome-bbdeiblfgdokhlblpgeaokenkfknecgl-Default
    # HyprlandではSwayのように特定のワークスペースでウィンドウが起動することを保証しにくい場合があります。
    # 必要であれば、Hyprlandのwindowruleを設定して、特定のアプリを特定のワークスペースに割り当てることを検討してください。
    # 例: windowrulev2 = workspace 10, class:^(JellyfinMediaPlayer)$
    # 例: windowrulev2 = workspace 10, class:^(chrome-bbdeiblfgdokhlblpgeaokenkfknecgl-Default)$
    # gtk-launch LINE--LINE--1748362244.746681 はSwayと同じように動作するはずです。
    # hyprctl dispatch exec gtk-launch LINE--LINE--1748362244.746681
fi

# ホスト名が archmini の場合
if [ "$hostname" = "archmini" ]; then
    hyprctl dispatch workspace 1
    hyprctl dispatch exec foot
fi
