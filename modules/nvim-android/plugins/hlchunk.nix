{
  programs.nixvim.plugins.hlchunk = {
    enable = true;
    settings = {
      chunk = {
        enable = true;
        chars = {
          horizontal_line = "─";
          vertical_line = "│";
          left_top = "╭";
          left_bottom = "╰";
          right_arrow = ">";
        };
        # style = "#78dce8";
    };
      indent.enable = true;
      line_num = {
        enable = true;
        use_treesitter = false;
      };
    };
    lazyLoad.settings = {
      event = [ "BufReadPost" "BufNewFile" ];
    };
  };
}
