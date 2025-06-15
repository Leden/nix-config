{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.roles.core;
in {
  options.${namespace}.roles.core.enable = lib.mkEnableOption "Enable core role";

  config = lib.mkIf cfg.enable {
    ${namespace} = {
      programs = {
        git.enable = true;
        nix.enable = true;
        speedtest-rs.enable = true;
      };
    };
  };
}
