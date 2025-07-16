{
  description = "Standalone home-manager dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # settings for hyprland
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:MarceColl/zen-browser-flake";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    Hyprspace = {
      url = "github:KZDKM/Hyprspace";
      # Hyprspace uses latest Hyprland. We declare this to keep them in sync.
      inputs.hyprland.follows = "hyprland";
    };
    astal.url = "github:aylur/astal";
    ags.url = "github:aylur/ags";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }@inputs:
    let
      # 各マシンごとに設定（system, path, username, homeDirectory）を指定
      userMachines = {
        nixos = {
          path = ./home/nixos.nix;
          system = "x86_64-linux";
          username = "user";
          homeDirectory = "/home/user";
        };
        thinkpad = {
          path = ./home/thinkpad.nix;
          system = "x86_64-linux";
          username = "user";
          homeDirectory = "/home/user";
        };
        xiaomipad = {
          path = ./home/xiaomipad.nix;
          system = "aarch64-linux";
          username = "nix-on-droid";
          homeDirectory = "/data/data/com.termux.nix/files/home";
        };
      };
    in
    {
      homeConfigurations = nixpkgs.lib.mapAttrs'
        (
          machine: cfg:
            let
              fullName = "${cfg.username}@${machine}";
              system = cfg.system;
            in
            {
              name = fullName;
              value = home-manager.lib.homeManagerConfiguration {
                pkgs = import nixpkgs {
                  inherit system;
                  config.allowUnfree = true;
                };
                extraSpecialArgs = { inherit inputs; };
                modules = [
                  inputs.nixvim.homeManagerModules.nixvim
                  cfg.path
                  {
                    home.username = cfg.username;
                    home.homeDirectory = cfg.homeDirectory;
                    home.stateVersion = "25.05";
                  }
                ];
              };
            }
        )
        userMachines;
    };
}
