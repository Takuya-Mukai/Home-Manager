return{
  {
    'vim-jp/vimdoc-ja',
    lazy = true,
    keys = {
      { "h", mode = "c", },
    },
  },
  -- {
  --   "keaising/im-select.nvim",
  --   config = function()
  --       require("im_select").setup({})
  --   end,
  -- },
  -- {
  --   'lambdalisue/vim-kensaku',
  --   dependencies = {
  --     'vim-denops/denops.vim',
  --     {
  --       'lambdalisue/kensaku-search.vim',
  --       config = function()
  --         vim.api.nvim_set_keymap('c', '<CR>', '<Plug>(kensaku-search-replace)<CR>', { noremap = true, silent = true })
  --       end,
  --       env = function()
  --         vim.cmd('let g:denops#deno = "/home/muta/.deno/bin/deno"')
  --       end,
  --     },
  --   },
  --   keys = {'/', mode = 'n'},
  -- },
}
