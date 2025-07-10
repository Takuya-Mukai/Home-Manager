local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")
  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)
  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end

vim.api.nvim_create_user_command('Ex', function() vim.cmd.NvimTreeToggle() end, {})
vim.keymap.set('n', '<leader>ex', vim.cmd.NvimTreeToggle)
local wk = require("which-key")
wk.add({
  {"<leader>ex", vim.cmd.NvimTreeToggle, desc = "Open nvim-tree"},
})
-- pass to setup along with your other options
require("nvim-tree").setup {
  on_attach = require('plugins-config.tools.nvim-tree-actions').on_attach,
}

