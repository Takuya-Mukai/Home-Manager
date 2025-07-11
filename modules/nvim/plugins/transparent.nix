{
  programs.nixvim.plugins.transparent = {
    enable = true;
    settings = {
      groups = [
        "Normal"
        "NormalNC"
      ];
    };
    lazyLoad.settings.event = [ "ColorScheme" ];
  };
}
