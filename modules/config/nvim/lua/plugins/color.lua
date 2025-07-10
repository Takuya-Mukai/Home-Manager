return{
  -- {
  --   "catppuccin/nvim", name = 'catppuccin', priority = 1000,
  --   config = function() require 'plugins-config.color.catppuccin' end,
  -- },
  {
    "rebelot/kanagawa.nvim",
    config = function() require 'plugins-config.color.kanagawa' end,
  },
  {
    "HiPhish/Rainbow-delimiters.nvim",
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = function() require 'plugins-config.color.rainbow-delimiters' end,
    event = "VimEnter",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    event = "BufReadPost",
    config = function() require 'plugins-config.color.nvim-treesitter' end,
    build = ":TSUpdate",
  },
}
