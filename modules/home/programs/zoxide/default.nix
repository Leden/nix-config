{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.zoxide;
in {
  options.${namespace}.programs.zoxide.enable = lib.mkEnableOption "Enable zoxide";

  config = lib.mkIf cfg.enable {
    programs.zoxide = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
