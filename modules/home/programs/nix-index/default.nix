{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.nix-index;
in {
  options.${namespace}.programs.nix-index.enable = lib.mkEnableOption "Enable nix-index and comma";
  config = lib.mkIf cfg.enable {
    programs.nix-index-database.comma.enable = true;
    programs.nix-index = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
