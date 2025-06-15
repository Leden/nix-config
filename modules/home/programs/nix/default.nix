{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.nix;
in {
  options.${namespace}.programs.nix.enable = lib.mkEnableOption "Enable nix";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      nix
    ];
  };
}
