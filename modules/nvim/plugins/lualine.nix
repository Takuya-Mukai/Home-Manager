{
  programs.nixvim.extraConfigLua = ''
    local function diff_source()
      local gitsigns = vim.b.gitsigns_status_dict
      if gitsigns then
        return {
          added = gitsigns.added,
          modified = gitsigns.changed,
          removed = gitsigns.removed
        }
      end
    end

    -- グローバルに公開（lualineが参照できるように）
    _G.diff_source = diff_source
  '';

  programs.nixvim.plugins.lualine = {
    lazyLoad.settings.event = [ "VimEnter" ];
    enable = true;
    settings = {
      option = {
        theme = "catppuccin";
        globalstatus = true;
        component_separators = {left = ""; right = "";};
        section_separators = {left = ""; right = "";};
      };
      sections = {
        lualine_a = [ "mode" ];
        lualine_b.__raw = ''{
          {
            "filename",
            newfile_status = true,
            path = 1,
            shorting_target = 24,
            symbols = {
              modified = " ",
              readonly = " ",
              newfile  = " ",
            },
          },
        }'';
        lualine_c.__raw = ''{
          {
            'diagnostics',
            sources = { 'nvim_diagnostic', 'nvim_lsp' },
            sections = { 'error', 'warn', 'info', 'hint' },
            symbols = {
              error = ' ',  -- error (U+EA87)
              warn  = ' ',  -- warning (U+EA6C)
              info  = ' ',  -- info (U+EA74)
              hint  = ' ',  -- hint/lightbulb (U+EA61)
            }
          },
          { 'navic' },
        }'';

        lualine_y = [
          "encoding"
          "filetype"
        ];
        lualine_z = [
          "progress"
          "location"
          "fileformat"
        ];
      };
      tabline = {
        lualine_a.__raw = ''{
          {
            "buffers",
            symbols = { modified = " ", readonly = " ", unnamed = " ", },
          },
        }'';
        lualine_b = [];
        lualine_c = [];

        lualine_x.__raw = ''{
          {
            require("noice").api.status.message.get_hl,
            cond = require("noice").api.status.message.has,
          },
          {
            require("noice").api.status.command.get,
            cond = require("noice").api.status.command.has,
            color = { fg = "#fab387" },
          },
          {
            require("noice").api.status.mode.get,
            cond = require("noice").api.status.mode.has,
            color = { fg = "#fab387" },
          },
          {
            require("noice").api.status.search.get,
            cond = require("noice").api.status.search.has,
            color = { fg = "#fab387" },
          },
        }'';
        lualine_y.__raw = ''{
          {
            "diff",
            symbols = {
              added    = " ",
              modified = " ",
              removed  = " ",
            },
            source = diff_source,
          },
          {
            'b:gitsigns_head',
            icon = ' ', 
            color = { fg = "#fc9867" },
          }
        }'';
        lualine_z = [ "tabs" ];
      };
    };
  };
}
