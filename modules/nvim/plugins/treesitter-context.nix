{
  programs.nixvim.plugins.treesitter-context = {
    enable = true;
    lazyLoad.settings.events = [
      "CursorMoved"
      "CursorMovedI"
    ];
  };
}
