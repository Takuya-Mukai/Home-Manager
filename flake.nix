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

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";
    username = "user";

    # machine名とnixファイルパスのペアだけを定義
    userMachines = {
      nixos = ./home/nixos.nix;
    };

  in {
    homeConfigurations = nixpkgs.lib.mapAttrs'
      (machine: path:
        let
          fullName = "${username}@${machine}";
        in {
          name = fullName;
          value = home-manager.lib.homeManagerConfiguration {
            pkgs = import nixpkgs {
              system = system;
              config.allowUnfree = true;
            };
            extraSpecialArgs = { inherit inputs; };
            modules = [
	      inputs.nixvim.homeManagerModules.nixvim
              path
              {
                home.username = username;
                home.homeDirectory = "/home/${username}";
                home.stateVersion = "25.05";
              }
            ];
          };
        })
      userMachines;
  };
}
