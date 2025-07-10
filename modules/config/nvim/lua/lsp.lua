return {
  {
    'folke/trouble.nvim',
    lazy = true,
    cmd = "Trouble",
    config = function() require 'plugins-config.lsp.trouble' end,
    dependencies = 'nvim-tree/nvim-web-devicons',
  },
  {
    'williamboman/mason.nvim',
    dependencies = {
      -- 'hrsh7th/cmp-nvim-lsp',
      {
        'williamboman/mason-lspconfig.nvim',
        config = function()
          require("mason-lspconfig").setup()
        end,
        event = "VimEnter",
      },
      {
        'neovim/nvim-lspconfig',
        config = function() require 'plugins-config.lsp.nvim-lspconfig' end,
        event = "BufReadPre",
      },
    },
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
      "MasonUpdate",
    },
    config = function() require 'plugins-config.lsp.mason' end,
  },
  {
    'nvimtools/none-ls.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = true,
    lazy = true,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    opts = {
      handlers = {}
    },
  },
}
