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
      action = "<CMD> lua require('telescope.builtin').help_tags(require('telescope.themes').get_ivy()) <CR>";
      key = "<leader>fh";
      options = {
        desc = "Help tags";
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
  programs.nixvim.extraConfigLua = ''
    require("which-key").add({
      { "<leader>f", group = "Telescope" },
      { "<leader>fe", group = "Extention" },
    })
  '';
}
