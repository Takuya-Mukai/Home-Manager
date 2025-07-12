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
    luaConfig.post = ''
      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal({']c', bang = true})
          else
            gitsigns.nav_hunk('next')
          end
        end, 'Next hunk')

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal({'[c', bang = true})
          else
            gitsigns.nav_hunk('prev')
          end
        end, 'Previous hunk')

        -- Actions
        map('n', '<leader>hs', gitsigns.stage_hunk, 'Stage hunk')
        map('n', '<leader>hr', gitsigns.reset_hunk, 'Reset hunk')

        map('v', '<leader>hs', function()
          gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, 'Stage selected hunk')

        map('v', '<leader>hr', function()
          gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, 'Reset selected hunk')

        map('n', '<leader>hS', gitsigns.stage_buffer, 'Stage buffer')
        map('n', '<leader>hR', gitsigns.reset_buffer, 'Reset buffer')
        map('n', '<leader>hp', gitsigns.preview_hunk, 'Preview hunk')
        map('n', '<leader>hi', gitsigns.preview_hunk_inline, 'Inline preview hunk')

        map('n', '<leader>hb', function()
          gitsigns.blame_line({ full = true })
        end, 'Blame line (full)')

        map('n', '<leader>hd', gitsigns.diffthis, 'Diff this')
        map('n', '<leader>hD', function()
          gitsigns.diffthis('~')
        end, 'Diff against last commit')

        map('n', '<leader>hQ', function()
          gitsigns.setqflist('all')
        end, 'Set quickfix list (all hunks)')

        map('n', '<leader>hq', gitsigns.setqflist, 'Set quickfix list (unresolved hunks)')

        -- Toggles
        map('n', '<leader>htb', gitsigns.toggle_current_line_blame, 'Toggle line blame')
        map('n', '<leader>htw', gitsigns.toggle_word_diff, 'Toggle word diff')

        -- Text object
        map({'o', 'x'}, 'ih', gitsigns.select_hunk, 'Select hunk')
      end
    '';
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
  programs.nixvim.extraConfigLua = ''
    require("which-key").add({
        { "<leader>h", group = "gitsigns" }
      })
  '';
}
