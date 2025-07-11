{
  programs.nixvim.plugins.gitsigns = {
    enable = true;
    settings = {
      signs = {
        add.text = " ┃";
        change.text = " ┃";
        delete.text = " ━" ;
        topdelete.text = " ┳";
        changedelete.text = " ┳";
        untracked.text = " ⡇";
      };
      signs_staged = {
        add.text = "┃ ";
        change.text = "┃ ";
        delete.text = "━ ";
        topdelete.text = "┳ ";
        changedelete.text = "┳ ";
        untracked.text = "⡇ ";
      };
      attach_to_untracked = false;
      signcolumn = true;
      word_diff = true;
      linehl = false;
      current_line_blame = true;
      current_line_blame_opts = {
        virt_text = true;
        virt_text_pos = "eol";
        delay = 100;
        ignore_whitespace = false;
      };
      current_line_blame_formatter = "  <author>, <author_time:%Y-%m-%d> - <summary>";
    };
    lazyLoad.settings = {
      event = [
        "BufReadPre"
        "BufNewFile"
        "InsertEnter"
        "TextChanged"
        "TextChangedI"
      ];
    };
  };
}
