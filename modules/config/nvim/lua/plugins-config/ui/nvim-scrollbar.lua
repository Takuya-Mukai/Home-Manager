require('scrollbar').setup()

-- require('scrollbar.handlers.search').setup()
require("scrollbar.handlers.gitsigns").setup()
-- init.lua

-- trouble.nvimを有効にする
vim.g.trouble_enable_lsp_signs = 1

-- gitsignsとの連携を有効にする
vim.g.gitsigns_integration_trouble = 1

