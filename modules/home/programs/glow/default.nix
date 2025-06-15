{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.glow;
in {
  options.${namespace}.programs.glow.enable = lib.mkEnableOption "Enable glow";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      glow
    ];

    xdg.configFile."glow/glow.yml".text = lib.generators.toYAML {} {
      # style name or JSON path (default "auto")
      style = "auto";

      # mouse support (TUI-mode only)
      mouse = true;

      # use pager to display markdown
      pager = false;

      # word-wrap at width
      width = 80;

      tui = true;
    };
  };
}
