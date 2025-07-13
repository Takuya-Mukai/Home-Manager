{
  programs.nixvim.plugins.nvim-surround = {
    enable = true;
  };
  programs.nixvim.extraConfigLua = ''
    require("which-key").add({
      { "<leader>s", group = "Surround" },

      { "<leader>sy", group = "Add surround" },
      { "<leader>syw", desc = "word → (word)    [ysiw)]" },
      { "<leader>sy$", desc = "to $ → \"...\"    [ys$\"]" },

      { "<leader>sd", group = "Delete surround" },
      { "<leader>sd]", desc = "brackets []      [ds]]" },
      { "<leader>sdt", desc = "HTML tag         [dst]" },
      { "<leader>sdf", desc = "function call () [dsf]" },

      { "<leader>sc", group = "Change surround" },
      { "<leader>sc'", desc = "' → \"              [cs'\"]" },
      { "<leader>sct", desc = "<tag> → <h1>       [cst]" },
    })
  '';
}
