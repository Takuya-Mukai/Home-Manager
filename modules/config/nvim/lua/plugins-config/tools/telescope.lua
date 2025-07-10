require('telescope').setup {
  lazy = true,
  defaults = {
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    mappings = {
      i = {
        ['<C-h>'] = 'which_key',
      },
    },
    winblend = 20,
  },
  extensions = {
    frecency = {
      show_scores = false,
      show_unindexed = true,
      ignore_patterns = { "*.git/*", "*/tmp/*" },
      disable_devicons = false,
      workspaces = {
        ["conf"]    = "/home/muta/.config",
        ["data"]    = "/home/muta/.local/share",
        ["project"] = "/home/muta/projects",
        ["wiki"]    = "/home/muta/wiki"
      }
    }
  },
}
local telescope = require'telescope'
telescope.load_extension('fzf')
telescope.load_extension('notify')

local themes = require("telescope.themes")
local tel_b = require("telescope.builtin")
local wk = require("which-key")
wk.add({
  {"<leader>", group = "plugins"},
  {"<leader>f", group = "telescope"},
  {"<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File"},
  {"<leader>fg","<cmd>Telescope live_grep<cr>", desc = "Live Grep"},
  {"<leader>fb","<cmd>Telescope buffurs<cr>", desc = "Buffers"},
  {"<leader>fh", function() tel_b.help_tags(themes.getivy()) end, desc = "Help Tags"},
  {"<leader>fd", function() tel_b.diagnostics(themes.get_ivy()) end, desc = "Diagnostics"},
  {"<leader>fr", function() tel_b.lsp_references(themes.get_ivy()) end, desc = "LSP References"},
  {"<leader>fs", function() tel_b.lsp_document_symbols(themes.get_ivy()) end, desc = "LSP Document Symbols"},
  {"<leader>fc", "<cmd>Telescope commands<cr>", desc = "All Commands"},
  {"<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps"},
  {"<leader>fi", "<cmd>Telescope builtin<cr>", desc = "Builtins"},
  {"<leader>fn", function() telescope.extensions.notify.notify() end, desc = "Notify", icon = "󰟶 "},
  {"<leader>n", group = "Navnuddy"},
  {"<leader>nb", "<cmd>lua require('nvim-navbuddy').open()<cr>", desc = "Navbuddy"},
})
