{ config, pkgs, inputs, ... }:
let
  nixvim-config = import ./nixvim-config.nix;
in
{
  inputs.programs.nixvim = nixvim-config.settings;
}
