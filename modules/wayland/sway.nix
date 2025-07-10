{ pkgs, ...}:
{
  home.packages = with pkgs; [
    sov
    swaylock-effects
    swaybg
    swayidle
    sway-audio-idle-inhibit
    swaynotificationcenter
    autotiling-rs
  ];
  wayland.windowManager.sway.enable = true;
  services.swayidle.enable = true;
  programs.swayimg.enable = true;
  # xdg.configFile."sway/config" = {
  #   source = ./config/sway/config;
  # };
  #
  # home.file.".local/bin/screenshot" = {
  #   source = ./scripts/sway-screenshot.sh;
  #   executable = true; # 実行権限を付与
  # };
}
