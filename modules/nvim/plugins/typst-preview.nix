{
  programs.nixvim.plugins.typst-preview = {
    enable = true;
    settings = {
      dependencies_bin = {
        tinymist = "tinymist";
        websocat = "websocat";
      };
    };
    lazyLoad.settings.ft = [ "typ" ];
  };
}
