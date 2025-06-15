{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.roles.media;
in {
  options.${namespace}.roles.media.enable = lib.mkEnableOption "Enable media role";

  config = lib.mkIf cfg.enable {
    programs.yt-dlp.enable = true;
    services.syncthing.enable = true;
  };
}
