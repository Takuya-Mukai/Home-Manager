{
  imports = [
    ../modules/cli.nix
    ../modules/gui.nix
    ../modules/localization/fcitx5.nix
    ../modules/theme/default.nix
    ../modules/wayland/core.nix
    ../modules/wayland/wlogout/default.nix
    ../modules/wayland/hypr/default.nix
    ../modules/wayland/hypr/monitor/hyprland-monitor-m75q.nix
    ../modules/rustdesk.nix
  ];
}
