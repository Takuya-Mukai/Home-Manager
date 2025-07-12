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
            function()
              local clients = vim.lsp.get_clients()
              if #clients == 0 then return "No LSP" end
              return " " .. clients[1].name
            end,
            color = { fg = "#7ec699" },
          },
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
        }'';
        lualine_x.__raw = ''{
          "encoding"
        }'';

        lualine_y = [
          "filetype"
          "fileformat"
        ];
        lualine_z = [
          "progress"
          "location"
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
