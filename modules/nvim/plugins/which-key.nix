{
  programs.nixvim.plugins.which-key = {
    enable = true;
    settings = {
      win = {
        border = "rounded";
        zindex = 1000;
        wo.winblend = 20;
        height = {
          min = 10;
          max = 20;
        };
        width = 0.4;
        row = 1;
        col.__raw = ''vim.o.columns - math.floor(vim.o.columns * 0.4) - 2'';
      };
      layout = {
        width = {
          min = 20;
          max = 0.4;
        };
        align = "left";
      };
    };
  };
}
