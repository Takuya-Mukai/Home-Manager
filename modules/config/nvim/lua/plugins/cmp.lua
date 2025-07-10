return {
  -- nvim-cmp 本体と、それに直接関連するソース
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    config = function() require 'plugins-config.cmp.nvim-cmp' end,
    dependencies = {
      -- nvim-cmpが依存するプラグインソースを列挙
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "kdheepak/cmp-latex-symbols",
      "zbirenbaum/copilot-cmp", -- copilot用のcmpソース
    },
  },

  -- スニペットエンジンとスニペット集
  {
    'L3MON4D3/LuaSnip',
    -- build = 'make install_jsregexp', -- Nix環境ではこの行を削除
    config = function() require 'plugins-config.cmp.luasnip' end,
    dependencies = { 'rafamadriz/friendly-snippets' },
    event = "InsertEnter",
  },

  -- UI/UX関連
  {
    "onsails/lspkind.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
  },

  -- Copilot関連
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function() require("plugins-config.cmp.copilot") end,
  },
  {
    'zbirenbaum/copilot-cmp',
    config = function() require('copilot_cmp').setup() end,
    dependencies = { "zbirenbaum/copilot.lua" },
  },
}
