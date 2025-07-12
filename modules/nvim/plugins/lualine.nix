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
              local names = {}

              for _, client in ipairs(clients) do
                if client.name ~= "copilot" then
                  table.insert(names, client.name)
                end
              end

              if vim.tbl_isempty(names) then
                return "No LSP"
              end

              return " " .. table.concat(names, ", ")
            end,
            color = function()
              local clients = vim.lsp.get_clients()
              for _, client in ipairs(clients) do
                if client.name ~= "copilot" then
                  return { fg = "#a6e3a1" }  -- LSPがあるとき：青
                end
              end
              return { fg = "#7f849c" }      -- No LSP（またはcopilotだけ）：グレー
            end,
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
