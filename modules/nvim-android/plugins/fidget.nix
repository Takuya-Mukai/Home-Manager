{
  programs.nixvim.plugins.fidget = {
    enable = true;
    settings = {
    };
    lazyLoad.settings.event = [ "LspAttach" ];
  };
}
