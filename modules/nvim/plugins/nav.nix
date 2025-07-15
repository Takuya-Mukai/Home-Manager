{
  programs.nixvim.plugins = {
    navic = {
      enable = true;
      lazyLoad.settings.event = [ "LspAttach" ];
    };
    navbuddy = {
      enable = true;
      lsp.autoAttach = true;
    };
  };
}
