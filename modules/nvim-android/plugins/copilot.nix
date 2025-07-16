{
  programs.nixvim.plugins."copilot-lua" = {
    enable = true;
    lazyLoad = {
      settings = {
        event = [ "InsertEnter" "CmdlineEnter" ];
      };
    };
    settings = {
      suggestion = { enabled = false; };
      panel = { enabled = false; };
    };
  };
}
