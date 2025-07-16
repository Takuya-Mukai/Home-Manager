{
  programs.nixvim.plugins = {
    luasnip = {
      enable = true;
      lazyLoad = {
        settings = {
          event = [ "InsertEnter" "CmdlineEnter" ];
          opts = {
            history = true;
            updateevents = "TextChanged,TextChangedI";
          };
        };
      };
    };

    blink-cmp = {
      enable = true;
      settings = {
        cmdline = {
          keymap = { preset = "inherit"; };
          completion = { menu = { auto_show = true;}; };
        };
        signature.window.border = "rounded";
        completion = {
          documentation.window.border = "rounded";
          menu.border = "rounded";
          documentation.auto_show = true;
          documentation.auto_show_delay_ms = 500;
          menu.auto_show = true;
          ghost_text.enabled = true;
          ghost_text.show_with_menu = true;
        };
        fuzzy.implementation = "prefer_rust_with_warning";

        snippets.preset = "luasnip";
        sources = {
          default = [ "lsp" "buffer" "snippets" "path" "copilot" "git" ];
          per_filetype = {
            markdown = [ "snippets" "lsp" "path" ];
          };
          providers.copilot = {
            async = true;
            module = "blink-cmp-copilot";
            name = "copilot";
            score_offset = 100;
            transform_items.__raw = ''
              function(_, items)
                local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
                local kind_idx = #CompletionItemKind + 1
                CompletionItemKind[kind_idx] = "Copilot"
                for _, item in ipairs(items) do
                  item.kind = kind_idx
                end
                return items
              end
            '';
          };

          providers.git = {
            module = "blink-cmp-git";
            name = "git";
            enabled.__raw = ''
              function()
                return vim.tbl_contains({ "octo", "gitcommit", "markdown" }, vim.bo.filetype)
              end
            '';
            score_offset = 100;
            opts = {
              commit = { };
              git_centers.git_hub = { };
            };
          };
        };

        appearance = {
          kind_icons = {
            Copilot = "";
            Text = "󰉿";
            Method = "󰊕";
            Function = "󰊕";
            Constructor = "󰒓";
            Field = "󰜢";
            Variable = "󰆦";
            Property = "󰖷";
            Class = "󱡠";
            Interface = "󱡠";
            Struct = "󱡠";
            Module = "󰅩";
            Unit = "󰪚";
            Value = "󰦨";
            Enum = "󰦨";
            EnumMember = "󰦨";
            Keyword = "󰻾";
            Constant = "󰏿";
            Snippet = "󱄽";
            Color = "󰏘";
            File = "󰈔";
            Reference = "󰬲";
            Folder = "󰉋";
            Event = "󱐋";
            Operator = "󰪚";
            TypeParameter = "󰬛";
          };
        };
      };

      lazyLoad.settings.event = [ "InsertEnter" "CmdlineEnter" ];
    };

    blink-cmp-copilot = {
      enable = true;
      lazyLoad.settings.event = [ "InsertEnter" "CmdlineEnter" ];
    };

    blink-cmp-git = {
      enable = true;
      lazyLoad.settings.event = [ "InsertEnter" "CmdlineEnter" ];
    };

    blink-cmp-spell = {
      enable = true;
      lazyLoad.settings.event = [ "InsertEnter" "CmdlineEnter" ];
    };

  };
}
