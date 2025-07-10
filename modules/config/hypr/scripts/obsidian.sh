#!/bin/bash

echo "スクリプト開始"

# Obsidianが実行中か確認
# Hyprlandでは'obsidian'というclassを持つウィンドウを検索します
if hyprctl clients -j | jq -e '.[] | select(.class == "obsidian")' > /dev/null; then
    # Obsidianウィンドウの情報を取得
    # Hyprlandでは特定のウィンドウのvisibleプロパティを直接取得するのが難しい場合があります。
    # ここでは、スペシャルワークスペースにあるかどうかで判定する代替ロジックを使います。
    # スペシャルワークスペースにある場合は非表示（=scratchpadにある状態）、そうでない場合は表示中と見なします。

    # Obsidianがスペシャルワークスペースにあるか確認
    is_in_special_workspace=$(hyprctl clients -j | jq -e '.[] | select(.class == "obsidian" and .workspace.name == "special")' > /dev/null; echo $?)

    if [ "$is_in_special_workspace" -eq 0 ]; then
        # スペシャルワークスペースにある（非表示の状態）場合、通常ワークスペースに戻す
        hyprctl dispatch togglespecialworkspace # これでspecial workspaceが表示され、Obsidianが可視になる
        # フルスクリーン化はSwayの`fullscreen enable`とは少し動作が異なる可能性がありますが、
        # Hyprlandでは通常、ウィンドウを通常ワークスペースに戻すだけで可視になります。
        # 必要に応じてフルスクリーン化を追加することも可能ですが、ここでは元のロジックに合わせます。
        # hyprctl dispatch fullscreen
    else
        # 通常ワークスペースにある（表示中の状態）場合、スペシャルワークスペースへ移動する
        hyprctl dispatch movetoworkspace special,class:obsidian
        # フルスクリーン解除の動作はSwayとは直接対応しません。
        # スペシャルワークスペースへの移動が「非表示」に相当します。
    fi
else
    # Obsidianが実行中でない場合、起動する
    obsidian
fi

echo "スクリプト終了"
