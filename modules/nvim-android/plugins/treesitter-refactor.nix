{
  programs.nixvim.plugins.treesitter-refactor = {
    enable = true;
    highlightCurrentScope.enable = true;
    highlightCurrentScope.disable = [];
    highlightDefinitions.enable = true;
    highlightDefinitions.clearOnCursorMove = true;
    smartRename = {
      enable = true;
      keymaps.smartRename = "\rr";
    };
    navigation = {
      enable = true;
      keymaps = {
        gotoDefinition = "\rgD";
        gotoDefinitionLspFallback = "\rgd";
        gotoNextUsage = "<a-*>";
        gotoPreviousUsage = "<a-#>";
        listDefinitions = "\rlD";
        listDefinitionsToc = "\rld";
      };
    };
  };
  programs.nixvim.extraConfigLua = ''

    vim.keymap.set('n', '<leader>rgD', function()
      require('nvim-treesitter-refactor.navigation').goto_definition()
    end, { noremap = true, silent = true, desc = "Go to definition" })

    vim.keymap.set('n', '<leader>rgd', function()
      require('nvim-treesitter-refactor.navigation').goto_definition_lsp_fallback()
    end, { noremap = true, silent = true, desc = "Go to definition with LSP fallback" })

    vim.keymap.set('n', '<leader>rlD', function()
      require('nvim-treesitter-refactor.navigation').list_definitions()
    end, { noremap = true, silent = true, desc = "List definitions" })

    vim.keymap.set('n', '<leader>rld', function()
      require('nvim-treesitter-refactor.navigation').list_definitions_toc()
    end, { noremap = true, silent = true, desc = "List definitions TOC" })

    vim.keymap.set('n', '<a-*>', function()
      require('nvim-treesitter-refactor.navigation').goto_next_usage()
    end, { noremap = true, silent = true, desc = "Go to next usage" })

    vim.keymap.set('n', '<a-#>', function()
      require('nvim-treesitter-refactor.navigation').goto_previous_usage()
    end, { noremap = true, silent = true, desc = "Go to previous usage" })

    vim.keymap.set('n', '<leader>rr', function()
      require('nvim-treesitter-refactor.smart_rename').smart_rename()
    end, { noremap = true, silent = true, desc = "Smart Rename" })

    require('which-key').add({
      { "<leader>r", group = "Treesitter-refactor"},
      { "<leader>rg", group = "Navigation"},
      { "<leader>rl", group = "List definition"},
    })
  '';
}
