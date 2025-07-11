{
  programs.nixvim.plugins.neoscroll = {
    enable = true;
    settings = {
    };
    lazyLoad.settings.event = [ "BufReadPost" "BufNewFile" "InsertEnter"];
  };
}
