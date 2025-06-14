{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.nh;
in {
  options.${namespace}.programs.nh.enable = lib.mkEnableOption "Enable nh";
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      nh
    ];

    home.sessionVariables = {
      # TODO: move the repo to simply ~/.nix-config, for all systems?
      NH_FLAKE = "${config.home.homeDirectory}/code/lesnov.me/nix-config"; # for nh
    };
  };
}
