{
  programs.nixvim.plugins.noice = {
    enable = true;
    settings = {
      lsp = {
        override = {
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown" = true;
          "cmp.entry.get_documentation" = true;
        };
      };
      presets = {
        bottom_search = false;
        command_palette = true;
        long_message_to_split = true;
        inc_rename = true;
        lsp_doc_border = true;
      };
    };
  };
  programs.nixvim.plugins.notify = {
    enable = true;
    settings = {
      background_colour = "#16161E";
    };
  };
  programs.nixvim.keymaps = [
    {
      action = "<CMD> Noice telescope <CR>";
      key = "<leader>fen";
      options = {
        desc = "Notifications";
        silent = true;
      };
    }
  ];
}
