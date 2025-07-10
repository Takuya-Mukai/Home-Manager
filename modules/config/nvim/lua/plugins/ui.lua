return{
  {
    'kevinhwang91/nvim-hlslens',
    keys = {"/", mode = "n"},
    config = function()
      require 'plugins-config.ui.nvim-hlslens'
    end,
    event = "CmdlineEnter",
  },
  {
    'petertriho/nvim-scrollbar',
    config = function ()
      require 'plugins-config.ui.nvim-scrollbar'
    end,
    event = "BufReadPre",
  },
  {
    'lewis6991/gitsigns.nvim',
    -- tag = 'v0.7.0',
    config = function ()
      require 'plugins-config.ui.gitsigns'
    end,
    event = "BufEnter",
  },
  {
    "shellRaining/hlchunk.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    event = "BufReadPost",
    config = function()
      require("hlchunk").setup({
        chunk = {enable = true},
        indent = {enable = true},
        line_num = {
          enable = true,
          use_treesitter = true,
        },
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function ()
      require 'plugins-config.ui.lualine'
    end,
    dependencies = {
      'nvim-tree/nvim-web-devicons', lazy = true
    },
    event = "BufEnter",
  },
  {
    'SmiteshP/nvim-navic',
    lazy = true,
    cmd = "InsertEnter",
    config = function() require 'plugins-config.ui.nvim-navic' end,
  },
  {
    "SmiteshP/nvim-navbuddy",
    keys = {"<leader>n", mode = "n"},
    config = function() require 'plugins-config.ui.nvim-navbuddy' end,
    dependencies = {
      'neovim/nvim-lspconfig',
      'SmiteshP/nvim-navic', 'MunifTanjim/nui.nvim', 'numToStr/Comment.nvim',
      'nvim-telescope/telescope.nvim',
    },
  },
  {
    'j-hui/fidget.nvim',
    event = "LspAttach",
    config = function() require 'plugins-config.ui.fidget' end,
  },
  {
    'rcarriga/nvim-notify',
    opts = {},
    config = function() require 'plugins-config.ui.nvim-notify' end,
    event = "BufEnter",
  },
}
