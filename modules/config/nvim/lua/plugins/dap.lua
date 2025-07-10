return{
    {
    'mfussenegger/nvim-dap',
    config = function() require 'plugins-config.dap.nvim-dap' end,
    lazy = true,
  },
  {
    'rcarriga/nvim-dap-ui',
    config = function() require 'plugins-config.dap.dapui' end,
    keys = {'<leader>d', '<F5>', mode = 'n'},
    dependencies = {
      {
        "folke/lazydev.nvim",
        opts = {
          library = {plugins= {"nvim-dap-ui"}, plugins=true}
        },
      },
      "nvim-dap",
      "nvim-neotest/nvim-nio",
    },
  },
  {
    'https://github.com/mfussenegger/nvim-dap-python',
    config = function() require 'plugins-config.dap.dap-python' end,
    ft = 'python',
    dependencies = 'mfussenegger/nvim-dap',
  },
  {
    'jay-babu/mason-nvim-dap.nvim',
    config = function() require('plugins-config.dap.mason-nvim-dap') end,
    dependencies = {
      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim'
    },
    lazy=true,
  },
}
