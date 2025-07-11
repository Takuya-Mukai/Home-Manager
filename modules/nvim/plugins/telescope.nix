{
  programs.nixvim.plugins.telescope = {
    enable = true;
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
      action = "function() require('telescope.builtin').help_tags() end";
      key = "<leader>fh";
      options = {
        desc = "Help tags";
        silent = true;
      };
    }
    {
      action = "function() require('telescope.builtin').lsp_document_symbols() end";
      key = "<leader>fs";
      options = {
        desc = "LSP document symbols";
        silent = true;
      };
    }
    {
      action = "function() require('telescope.builtin').lsp_workspace_symbols() end";
      key = "<leader>fw";
      options = {
        desc = "LSP workspace symbols";
        silent = true;
      };
    }
    {
      action = "function() require('telescope.builtin').lsp_references() end";
      key = "<leader>fr";
      options = {
        desc = "LSP references";
        silent = true;
      };
    }
    {
      action = "function() require('telescope.builtin').diagnostics() end";
      key = "<leader>fd";
      options = {
        desc = "Diagnostics";
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
    {
      action = "function() require('telescope').extensions.notify.notify() end";
      key = "<leader>fn";
      options = {
        desc = "Notifications";
        silent = true;
      };
    }
  ];
}
