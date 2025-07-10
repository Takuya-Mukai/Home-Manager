{ pkgs }:
let
  # nixvim-plugins = import ./nixvim-plugins.nix;
  # nixvim-keymaps = import ./nixvim-keymaps.nix;
  colorscheme = import ./tokyonight.nix;
in
{
  settings = {
    enable = true;
    vimAlias = true;
    colorschemes.tokyonight = colorscheme.settings;
    opts = {
      termguicolors     = true;
      number            = true;
      relativenumber    = true;
      cursorline        = false;
      wrap              = false;
      scrolloff         = 13;
      sidescrolloff     = 12;
      ignorecase        = true;
      smartcase         = true;
      showmatch         = true;
      matchtime         = 1;
      updatetime        = 300;
      swapfile          = false;
      whichwrap         = "b,s,<,>,[,]";
      pumblend          = 20;
      winblend          = 20;
      showmode          = false;
      conceallevel      = 1;
      hlsearch          = true;
      incsearch         = true;
      list              = true;
      listchars         = "eol:¬,tab:> ,trail:·,nbsp:%";
      wildmenu          = true;
      wildmode          = "list:longest,full";
      softtabstop       = 2;
      tabstop           = 2;
      shiftwidth        = 2;
      expandtab         = true;
      autoindent        = true;
      smartindent       = true;
    };
    globalOpts = {
      clipboard        = "unnamedplus";
      laststatus       = 3;
    };
    globals = {
      maplocalleader   = " ";
      loaded_netrw     = 1;
      loaded_netrwPlugin = 1;
      helplang         = "ja,en";
    };
    localOpts = {
      signcolumn = "yes:1";
    };
    extraConfigVim = ''
      autocmd TermOpen * setlocal nonumber norelativenumber
    '';
    extraConfigLua = ''
      -- fcitx5 Japanese IME 自動切替
      local fcitx5state = vim.fn.system("fcitx5-remote"):sub(1,1)
      vim.api.nvim_create_autocmd("InsertLeave", {
        callback = function()
          fcitx5state = vim.fn.system("fcitx5-remote"):sub(1,1)
          vim.fn.system("fcitx5-remote -c")
        end,
      })
      vim.api.nvim_create_autocmd("InsertEnter", {
        callback = function()
          if fcitx5state == "2" then
            vim.fn.system("fcitx5-remote -o")
          end
        end,
      })
      -- 書き込み前に行末スペースを削除
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function()
          vim.cmd [[%s/\\s\\+$//e]]
        end,
      })
    '';
    # plugins = nixvim-plugins;
    # keymaps = nixvim-keymaps;
  };
}

