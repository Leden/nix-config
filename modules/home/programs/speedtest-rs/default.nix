{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.speedtest-rs;
in {
  options.${namespace}.programs.speedtest-rs.enable = lib.mkEnableOption "Enable speedtest-rs";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      speedtest-rs
    ];
  };
}
