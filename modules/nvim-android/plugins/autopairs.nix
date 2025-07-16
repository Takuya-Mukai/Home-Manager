{
  programs.nixvim.plugins.nvim-autopairs = {
    enable = true;
    settings = {
      faset_wrap = true;
      enable_check_bracket_line = true;
    };
    lazyLoad.settings.event = [ "InsertEnter" ];
  };
}
