{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: let
  inherit (lib) mkEnableOption mkOption mkIf types;

  cfg = config.${namespace}.programs.direnv;
in {
  options.${namespace}.programs.direnv = {
    enable = mkEnableOption "Enable direnv";
  };
  config = mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
      silent = true;
      config.global.load_dotenv = true;
    };
  };
}
