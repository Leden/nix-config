{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.roles.development;
in {
  options.${namespace}.roles.development.enable = lib.mkEnableOption "Enable development role";

  config = lib.mkIf cfg.enable {
    ${namespace} = {
      programs = {
        aider.enable = true;
        nix-index.enable = true;
        nh.enable = true;
      };
    };

    packages = with pkgs; [
      bat
      btop
      du-dust
      fd
      fzf
      glow # TODO: alias -p
      ripgrep
      yt-dlp
      zellij
      zoxide # TODO: extract module & config
    ];
  };
}
