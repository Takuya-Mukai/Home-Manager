{ pkgs, ...}:
{
  home.packages = with pkgs; [
    font-awesome
    workstyle
  ];
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
  };
}
