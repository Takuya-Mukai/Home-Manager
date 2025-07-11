{
  programs.nixvim.plugins.oil = {
    enable = true;
    settings = {
      win_options = {
        signcolumn = "yes:2";
        winblend = 10;
      };
    };
    lazyLoad.settings = {
      event = [ "VimEnter" ];
      keys = [
        "<leader>ex"
        "-"
      ];
    };
  };

  programs.nixvim.plugins.oil-git-status = {
    enable = true;
    lazyLoad.settings.keys = [
      "-"
      "<leader>ex"
    ];
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>ex";
      action = "<CMD>topleft vertical 30 vsplit | lua require('oil').open()<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Toggle Oil.nvim window";
      };
    }
    {
      mode = "n";
      key = "-";
      action = "<CMD>lua require('oil').open_float()<CR>";
      options = {
        desc = "Open Oil (float)";
        silent = true;
      };
    }
  ];
  programs.nixvim.autoCmd = [
    {
      event = "VimEnter";
      pattern = "*";
      command = ''
        lua if vim.fn.isdirectory(vim.fn.argv(0)) == 1 then require("oil").open() end
      '';
    }
  ];
  programs.nixvim.extraConfigLua = ''
    vim.api.nvim_create_autocmd("WinEnter", {
      callback = function()
        local bufname = vim.api.nvim_buf_get_name(0)
        if bufname:match("^oil://") then
          vim.wo.number = false
          vim.wo.relativenumber = false
        end
      end,
    })
  '';
}
