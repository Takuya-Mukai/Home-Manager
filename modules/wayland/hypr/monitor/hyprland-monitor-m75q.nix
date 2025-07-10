{
  wayland.windowManager.hyprland.settings = {
    # ワークスペースとモニターの割り当て
    workspace = [
      "1, monitor:DP-2"
      "2, monitor:DP-2"
      "3, monitor:DP-1"
      "4, monitor:DP-1"
      "5, monitor:DP-1"
      "6, monitor:DP-1"
      "7, monitor:HDMI-A-1"
      "8, monitor:HDMI-A-1"
      "9, monitor:HDMI-A-1"
      "10,monitor:HDMI-A-1"
    ];

    # モニターの物理的な設定
    monitor = [
      "DP-1, 1920x1080@60, 1080x445, 1"
      "DP-2, 1920x1080@60, 0x0, 1, transform, 1"
      "HDMI-A-1, 1920x1080@60, 3000x0, 1, transform, 3"
      "Virtual-1, 1920x1080@60, 0x0, 1"
    ];
  };
}
