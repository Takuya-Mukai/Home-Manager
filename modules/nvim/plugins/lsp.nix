{
  programs.nixvim.plugins.lspconfig.enable = true;
  programs.nixvim.lsp.servers = {
    lua_ls.enable = true;
    rust_analyzer.enable = true;
    tsserver.enable = true;
    pyright.enable = true;
    nil_ls.enable = true;
  };
}
