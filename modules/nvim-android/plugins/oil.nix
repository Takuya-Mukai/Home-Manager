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
        "<leader>o"
      ];
    };
  };

  programs.nixvim.plugins.oil-git-status = {
    enable = true;
    lazyLoad.settings.keys = [
      "<leader>o"
    ];
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>ol";
      action = "<CMD>topleft vertical 30 vsplit | lua require('oil').open()<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Toggle window";
      };
    }
    {
      mode = "n";
      key = "<leader>oF";
      action = "<CMD>lua require('oil').open_float()<CR>";
      options = {
        desc = "Wide floating window";
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

    function OpenOilInFloat()
      -- 固定サイズ
      local fixed_width = 30
      local fixed_height = 20

      -- 画面サイズ取得
      local total_cols = vim.o.columns
      local total_lines = vim.o.lines

      -- 入り切るか判定
      local width = fixed_width
      if total_cols < fixed_width + 4 then
        width = math.floor(total_cols * 0.4) -- 相対サイズに切り替え
      end

      local height = fixed_height
      if total_lines < fixed_height + 4 then
        height = math.floor(total_lines * 0.6)
      end

      -- 右上に寄せて、少し下に余白（row: 1〜2）
      local col = total_cols - width - 2
      local row = 2

      -- scratch buffer
      local buf = vim.api.nvim_create_buf(false, true)

      -- フロート作成
      vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width = width,
        height = height,
        row = row,
        col = col,
        style = 'minimal',
        border = 'rounded',
      })

      -- oil 起動
      vim.cmd("Oil")

      -- q で閉じる
      vim.keymap.set("n", "q", function()
        vim.api.nvim_win_close(0, true)
      end, { buffer = true })
    end
    vim.keymap.set("n", "<leader>of", OpenOilInFloat, { desc = "floating window" })

    require("which-key").add({
      { "<leader>o", group = "Oil" }
    })
  '';
}
