{
  programs.nixvim.plugins.trouble = {
    enable = true;
    lazyLoad.settings.event = [ "LspAttach" ];
    # luaConfig.post = ''
    #   require("trouble").setup({
    #     modes = {
    #       -- 1. カレントバッファ限定 + 高優先度順 + プレビューあり
    #       current_buffer_priority = {
    #         mode = "diagnostics",
    #         filter = {
    #           buf = 0, -- カレントバッファ限定
    #         },
    #         sort = {
    #           -- エラー > 警告 > その他
    #           { "severity", "desc" },
    #         },
    #         preview = {
    #           type = "split",
    #           relative = "win",
    #           position = "right",
    #           size = 0.3,
    #         },
    #       },
    #
    #       -- 2. 全体対象 + 高優先度順 + プレビューあり
    #       all_buffers_priority = {
    #         mode = "diagnostics",
    #         sort = {
    #           { "severity", "desc" },
    #         },
    #         preview = {
    #           type = "split",
    #           relative = "win",
    #           position = "right",
    #           size = 0.3,
    #         },
    #       },
    #     },
    #   })
    # '';
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
    vim.schedule(function()
      local has_lualine, lualine = pcall(require, "lualine")
      local has_trouble, trouble = pcall(require, "trouble")

      if not (has_lualine and has_trouble) then
        return
      end

      -- trouble の statusline 情報取得関数を作成
      local symbols = trouble.statusline({
        mode = "lsp_document_symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal}",
        hl_group = "lualine_x_normal",
      })

      -- lualine の現在の tabline の lualine_x に trouble の表示用関数を追加
      local config = lualine.get_config()
      table.insert(config.tabline.lualine_x, {
        symbols.get,
        cond = symbols.has,
      })

      -- 追加した設定で lualine を再セットアップ
      lualine.setup(config)
    end)

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
