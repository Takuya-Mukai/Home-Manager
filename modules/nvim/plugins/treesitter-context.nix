{
  programs.nixvim.plugins.treesitter-context = {
    enable = true;
    lazyLoad.settings.events = [
      "BufReadPost"
      "BufNewFile"
    ];
  };
}
