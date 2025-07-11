{
  programs.nixvim.plugins.navbuddy = {
    enable = true;
    lsp.autoAttach = true;
    window = {
      border = "rounded";
      scrolloff = 3;
    };
  };
  programs.nixvim.plugins.navic = {
    enable = true;
    settings = {
      lsp.auto_attach = true;
      highlighgt = true;
      depth_limit = 9;
      icons = {
        File = " ";
        Module = " ";
        Namespace = " ";
        Package = " ";
        Class = " ";
        Method = " ";
        Property = " ";
        Field = " ";
        Constructor = " ";
        Enum = " ";
        Interface = " ";
        Function = " ";
        Variable = " ";
        Constant = " ";
        String = " ";
        Number = " ";
        Boolean = " ";
        Array = " ";
        Object = " ";
        Key = " ";
        Null = " ";
        EnumMember = " ";
        Struct = " ";
        Event = " ";
        Operator = " ";
        TypeParameter = " ";
      };
    };
    lazyLoad.settings.event = [ "LspAttach" ];
  };
  programs.nixvim.extraConfigLua = ''
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        if vim.api.nvim_buf_line_count(0) > 10000 then
          vim.b.navic_lazy_update_context = true
        end
      end,
    })
  '';
  programs.nixvim.keymaps = [
    {
      action = "<CMD> lua vim.cmd.Navbuddy() <CR>";
      key = "<leader>nb";
      options = {
        desc = "Navbuddy";
      };
    }
  ];
}
