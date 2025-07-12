{
  programs.nixvim.plugins = {
    yazi = {
      enable = true;
      settings = {
        keymaps = {
          open_file_in_horizontal_split = "<c-x>";
        };
      };
      lazyLoad.settings.key = [ "<leader>y" ];
    };
    lazygit = {
      enable = true;
    };
    toggleterm = {
      enable = true;
      lazyLoad.settings.keys = [ "<c-t>" ];
      settings = {
        open_mapping = ''"<c-t>"'';
        hide_numbers = true;
        start_in_insert = true;
        insert_mappings = true;
        direction = "float";
        float_opts.__raw = ''{
          border = "rounded",
          width = function()
            return math.floor(vim.o.columns * 0.9)
          end,
          height = function()
            return math.floor(vim.o.lines * 0.45)
          end,
          row = 1,
          col = function()
            return math.floor((vim.o.columns - vim.o.columns * 0.9) / 2)
          end,
          winblend = 20,
          zindex = 150,
          title_pos = "center",
        }'';
      };
    };
    diffview = {
      enable = true;
    };
  };

  programs.nixvim.keymaps = [
    {
      action = "<cmd>Yazi<cr>";
      key = "<leader>y-";
      options = {
        desc = "Open at the current file";
      };
    }
    {
      action = "<cmd>Yazi cwd<cr>";
      key = "<leader>yc";
      options = {
        desc = "Yazi: Change working directory";
      };
    }
    {
      action = "<cmd>Yazi toggle<cr>";
      key = "<leader>yt";
      options = {
        desc = "Resume the last session";
      };
    }
    {
      action = "<cmd>LazyGit";
      key = "<leader>gg";
      options = {
        desc = "Open LazyGit";
      };
    }
    {
      action = "<cmd>DiffviewOpen<CR>";
      key = "<leader>gd";
      options = {
        desc = "Open Diffview";
      };
    }
  ];
  programs.nixvim.extraConfigLua = ''
    require("which-key").add({
      { "<leader>y", group = "Yazi" },
      { "<leader>g", group = "Git" },
    })
  '';
}
