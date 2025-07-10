require('gitsigns').setup {
  signs = {
    add          = {text = ' ▎', },
    change       = {text = ' ▎', },
    delete       = {text = '', },
    topdelete    = {text = '', },
    changedelete = {text = '▎', },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = false,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end)
  end
}

local wk = require("which-key")
local gs = package.loaded.gitsigns
local gitsigns = require('gitsigns')
wk.add({
  {"<leader>h", group = "Git func", icon = {"󰊢", color = "orange"}},
  {"<leader>hS","<cmd>Gitsigns stage_hunk<CR>", mode = {'n', 'v'}, desc = "Stage hunk"},
  {"<leader>hr","<cmd>Gitsigns reset_hunk<CR>", mode = {'n', 'v'}, desc = "Reset hunk"},
  {"<leader>hR", function() gs.state_buffer() end, desc = "stage buffer"},
  {"<leader>hp", function() gs.preview_hunk() end, desc = "Preview hunk"},
  {"<leader>hb", function() gs.blame_line{full=true} end, desc = "Blame line"},
  {"<leader>hd", function() gs.diffthis() end, desc = "Diff", icon = "󰕚"},
  {"<leader>hd", function() gs.diffthis('~') end, desc = "Diff ~", icon = "󰕚"},

  {"<leader>t", group = "Toggle"},
  {"<leader>tb", gitsigns.toggle_current_line_blame, desc = "Git toggle current line blame", icon = {"󰊢", color = "orange"}},
  {"<leader>td", gitsigns.toggle_deleted, desc = "Gittoggle deleted line", icon = {"󰊢", color = "orange"}},

  {'ih', ':<C-U>Gitsigns select_hunk<CR>', mode = {'o', 'x'}, desc = "hunk selected"},

  {']c', function() if vim.wo.diff then vim.cmd.normal({']c', bang = true}) else gitsigns.nav_hunk('next') end end, desc = "next hunk"},
  {'[c', function() if vim.wo.diff then vim.cmd.normal({'[c', bang = true}) else gitsigns.nav_hunk('prev') end end, desc = "preview hunk"},

})
