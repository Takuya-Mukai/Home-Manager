local function find_plugin_base_path(plugin_name)
  for _, path in ipairs(vim.api.nvim_list_runtime_paths()) do
    if path:find(plugin_name, 1, true) then
      return path:match("(.*/pack/[^/]+/start/)")
    end
  end
  return nil
end

local lazy_plugin_path = find_plugin_base_path("lualine.nvim")

-- fallback 対応（なくても動くように）
if not lazy_plugin_path then
  vim.notify("lualine.nvim のパスが見つかりませんでした", vim.log.levels.WARN)
  lazy_plugin_path = "" -- fallback to empty
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- lazy.nvim 初期化
require("lazy").setup({
  dev = {
    path = lazy_plugin_path,
    patterns = { "" },
  },
  spec = {
    { import = "plugins" },
  },
  checker = {
    enabled = false,
  },
  install = {
    missing = false,
  },
  ui = {
    border = "single",
  },
  performance = {
    rtp = {
      reset = false,
    },
  },
})

