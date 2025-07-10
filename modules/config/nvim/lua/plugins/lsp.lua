return {
  {
    'folke/trouble.nvim',
    lazy = true,
    cmd = "Trouble",
    config = function() require 'plugins-config.lsp.trouble' end,
    dependencies = 'nvim-tree/nvim-web-devicons',
  },
  -- {
  --   'williamboman/mason.nvim',
  --   lazy = false, -- Masonは常にロードされるようにします
  --   cmd = {
  --     "Mason",
  --     "MasonInstall",
  --     "MasonUninstall",
  --     "MasonUninstallAll",
  --     "MasonLog",
  --     "MasonUpdate",
  --   },
  --   -- Mason自身のセットアップ
  --   config = function()
  --     require 'plugins-config.lsp.mason' -- ここで require("mason").setup() が呼ばれることを確認
  --   end,
  -- },
  -- {
  --   'williamboman/mason-lspconfig.nvim',
  --   -- mason.nvim に依存することを明示し、mason.nvim がロードされた後に設定が実行されるようにします
  --   dependencies = {
  --     'williamboman/mason.nvim', -- Mason に依存することを明示
  --     'neovim/nvim-lspconfig',   -- nvim-lspconfig にも依存するので追加
  --   },
  --   -- Mason-lspconfig自身のセットアップ
  --   config = function()
  --     require("mason-lspconfig").setup()
  --   end,
  --   -- event = "VimEnter", -- Mason が lazy=false なので、このイベントは不要かもしれません
  -- },
  {
    'neovim/nvim-lspconfig',
    -- nvim-lspconfig の設定
    config = function() require 'plugins-config.lsp.nvim-lspconfig' end,
    event = "BufReadPre", -- バッファを読み込む前にLSPをロード
  },
  {
    'nvimtools/none-ls.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = true,
    event = { "BufReadPre", "BufNewFile" },
  },
  -- {
  --   "jay-babu/mason-null-ls.nvim",
  --   event = { "BufReadPre", "BufNewFile" },
  --   dependencies = {
  --     "williamboman/mason.nvim",
  --     "nvimtools/none-ls.nvim",
  --   },
  --   opts = {
  --     handlers = {}
  --   },
  -- },
}
