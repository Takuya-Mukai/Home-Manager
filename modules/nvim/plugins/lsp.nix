{
  programs.nixvim.plugins.lspconfig = {
    enable = true;
  };
  programs.nixvim.plugins.lsp-format = {
    enable = true;
  };
  programs.nixvim.lsp.servers = {
    lua_ls.enable = true;
    rust_analyzer.enable = true;
    tsserver.enable = true;
    pyright.enable = true;
    nil_ls.enable = true;
    ruff.enable = true;
    clangd.enable = true;
    bashls.enable = true;
    sqls.enable = true;
    yamlls.enable = true;
    tinymist.enable = true;
  };
  programs.nixvim.lsp.keymaps = [
    # ========== 基本操作（直感操作） ==========
    {
      key = "gd";
      lspBufAction = "definition";
      options.desc = "Go to definition";
    }
    {
      key = "gD";
      lspBufAction = "references";
      options.desc = "Find references";
    }
    {
      key = "gt";
      lspBufAction = "type_definition";
      options.desc = "Go to type definition";
    }
    {
      key = "gi";
      lspBufAction = "implementation";
      options.desc = "Go to implementation";
    }
    {
      key = "K";
      lspBufAction = "hover";
      options.desc = "Hover info";
    }

    # ========== Telescope / Lspsaga 系 ==========
    {
      key = "<leader>lD";
      action.__raw = "require('telescope.builtin').lsp_definitions";
      options.desc = "Definitions";
    }
    {
      action = "<CMD> lua require('telescope.builtin').lsp_document_symbols(require('telescope.themes').get_cursor()) <CR>";
      key = "<leader>ls";
      options = {
        desc = "Document symbols";
        silent = true;
      };
    }
    {
      action = "<CMD> lua require('telescope.builtin').lsp_workspace_symbols(require('telescope.themes').get_cursor()) <CR>";
      key = "<leader>lw";
      options = {
        desc = "Workspace symbols";
        silent = true;
      };
    }
    {
      action = "<CMD> lua require('telescope.builtin').lsp_references(require('telescope.themes').get_cursor()) <CR>";
      key = "<leader>lr";
      options = {
        desc = "References";
        silent = true;
      };
    }
    {
      action = "<CMD> lua require('telescope.builtin').diagnostics(require('telescope.themes').get_ivy()) <CR>";
      key = "<leader>ld";
      options = {
        desc = "Diagnostics";
        silent = true;
      };
    }
    # ========== Diagnostic ナビゲーション ==========
    {
      key = "<leader>lk";
      action.__raw = "function() vim.diagnostic.jump({ count=-1, float=true }) end";
      options.desc = "Previous diagnostic";
    }
    {
      key = "<leader>lj";
      action.__raw = "function() vim.diagnostic.jump({ count=1, float=true }) end";
      options.desc = "Next diagnostic";
    }

    # ========== LSP サーバ制御 ==========
    {
      key = "<leader>lx";
      action = "<CMD>LspStop<CR>";
      options.desc = "LSP stop";
    }
    {
      key = "<leader>ls";
      action = "<CMD>LspStart<CR>";
      options.desc = "LSP start";
    }
    {
      key = "<leader>lr";
      action = "<CMD>LspRestart<CR>";
      options.desc = "LSP restart";
    }
  ];
  programs.nixvim.extraConfigLua = ''
    require("which-key").add({
      { "<leader>l", group = "LSP" },
      { "g", group = "Move" },
    })
  '';
}
