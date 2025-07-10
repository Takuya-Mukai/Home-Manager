return {
  {
    'chomosuke/typst-preview.nvim',
    ft = 'typst', -- or ft = 'typst'
    version = '1.*',
    opts = {}, -- lazy.nvim will implicitly calls `setup {}`
    config = function()
      require("plugins-config.tools.typst-preview")
    end,
  }
}
