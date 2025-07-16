{
  programs.nixvim.plugins.trouble = {
    enable = true;
    lazyLoad.settings.keys = [ "<leader>x" ];
  };
  programs.nixvim.keymaps = [
    {
      action = "<CMD>Trouble symbols toggle focus=false<CR>";
      key = "<leader>xs";
      options = {
        desc = "Symbols (Trouble)";
      };
    }
    {
      action = "<CMD>Trouble lsp toggle focus=false win.position=right<CR>";
      key = "<leader>xl";
      options = {
        desc = "LSP Definitions / references / ... (Trouble)";
      };
    }
    {
      action = "<CMD>Trouble loclist toggle<CR>";
      key = "<leader>xL";
      options = {
        desc = "Location List (Trouble)";
      };
    }
    {
      action = "<CMD>Trouble qflist toggle<CR>";
      key = "<leader>xQ";
      options = {
        desc = "Quickfix List (Trouble)";
      };
    }
  ];

  programs.nixvim.extraConfigLua =''
    vim.keymap.set("n", "<leader>xx", function()
      require("trouble").toggle({
        mode = "diagnostics",
        filter = { buf = 0 },
        sort = { { "severity", "desc" } },
        preview = { type = "split", relative = "win", position = "right", size = 0.4 },
      })
    end, { desc = "Trouble: Current Buffer Diagnostics" })

    vim.keymap.set("n", "<leader>xX", function()
      require("trouble").toggle({
        mode = "diagnostics",
        sort = { { "severity", "desc" } },
        preview = { type = "split", relative = "win", position = "right", size = 0.4 },
      })
    end, { desc = "Trouble: All Buffers Diagnostics" })

    require("which-key").add({
      { "<leader>x", group = "Trouble" }
    })
  '';
}
