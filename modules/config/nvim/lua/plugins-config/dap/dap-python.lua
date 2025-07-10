require('dap-python').setup('~/.local/share/nvim/mason/packages/debugpy/venv/bin/python3')
vim.api.nvim_set_keymap('n', '<leader>dn', ':lua require("dap-python").test_method()<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>df', ':lua require("dap-python").test_class()<CR>', {silent = true})
vim.api.nvim_set_keymap('v', '<leader>ds', '<ESC>:lua require("dap-python").debug_selection()<CR>', {silent = true})
