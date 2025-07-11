{
  programs.nixvim.plugins.telescope = {
    enable = true;
    settings = {
      defaults = {
        layout_strategy = "vertical";
        sorting_strategy = "ascending";
        layout_config = {
          prompt_position = "top";
          preview_cutoff = 20;
        };
      };
    };
  };
  programs.nixvim.keymaps = [
    {
      action = "<cmd> Telescope find_files <CR>";
      key = "<leader>ff";
      options = {
        desc = "Find files";
        silent = true;
      };
    }
    {
      action = "<cmd> Telescope live_grep <CR>";
      key = "<leader>fg";
      options = {
        desc = "Live grep";
        silent = true;
      };
    }
    {
      action = "<cmd> Telescope buffers <CR>";
      key = "<leader>fb";
      options = {
        desc = "List buffers";
        silent = true;
      };
    }
    {
      action = "<CMD> lua require('telescope.builtin').help_tags(require('telescope.themes').get_ivy()) end";
      key = "<leader>fh";
      options = {
        desc = "Help tags";
        silent = true;
      };
    }
    {
      action = "<CMD> lua require('telescope.builtin').lsp_document_symbols(require('telescope.themes').get_cursor()) end";
      key = "<leader>fs";
      options = {
        desc = "LSP document symbols";
        silent = true;
      };
    }
    {
      action = "<CMD> lua require('telescope.builtin').lsp_workspace_symbols(require('telescope.themes').get_cursor()) end";
      key = "<leader>fw";
      options = {
        desc = "LSP workspace symbols";
        silent = true;
      };
    }
    {
      action = "<CMD> lua require('telescope.builtin').lsp_references(require('telescope.themes').get_cursor()) end";
      key = "<leader>fr";
      options = {
        desc = "LSP references";
        silent = true;
      };
    }
    {
      action = "<CMD> lua require('telescope.builtin').diagnostics(require('telescope.themes').get_ivy()) end";
      key = "<leader>fd";
      options = {
        desc = "LSP Diagnostics";
        silent = true;
      };
    }
    {
      action = "<cmd> Telescope commands <CR>";
      key = "<leader>fc";
      options = {
        desc = "List commands";
        silent = true;
      };
    }
    {
      action = "<cmd> Telescope keymaps <CR>";
      key = "<leader>fk";
      options = {
        desc = "List keymaps";
        silent = true;
      };
    }
    {
      action = "<cmd> Telescope builtin <CR>";
      key = "<leader>fi";
      options = {
        desc = "List built-in pickers";
        silent = true;
      };
    }
  ];
}
