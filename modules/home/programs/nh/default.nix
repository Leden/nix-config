{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: let
  inherit (lib) mkEnableOption mkOption mkIf types;

  cfg = config.${namespace}.programs.nh;
in {
  options.${namespace}.programs.nh = {
    enable = mkEnableOption "Enable nh";

    package = mkOption {
      type = types.package;
      default = pkgs.nh;
    };

    flake-path = mkOption {
      type = types.str;
      default = "${config.home.homeDirectory}/.nix-config";
    };
  };
  config = mkIf cfg.enable {
    home.packages = [cfg.package];

    home.sessionVariables = {
      NH_FLAKE = cfg.flake-path;
    };
  };
}
