require("toggleterm").setup({
  open_mapping = [[<leader>tt]],
  shade_terminals = true,
  shading_factor = 0.5,
  direction = "float",
  size = vim.o.columns * 0.4,
  float_opts = {
    border = "single",
  },
})

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

local wk = require("which-key")
wk.add({
  {"<leader>tg", "<cmd>lua _lazygit_toggle()<CR>", noremap = true, silent = true, desc = "lazygit"},
})
