return {
  'salkin-mada/openscad.nvim',
  config = function ()
    require('openscad')
    -- load snippets, note requires
    vim.g.openscad_load_snippets = true
    vim.g.openscad_default_mappings = true
  end,
  dependencies = {
    'L3MON4D3/LuaSnip'
  },
  ft = 'openscad',
  lazy = true,
}
