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
        glow.enable = true;
        zoxide.enable = true;
        direnv.enable = true;
        nixvim.enable = true;
      };
    };

    programs = {
      bat.enable = true;
      btop.enable = true;
      fd.enable = true;
      fzf.enable = true;
      ripgrep.enable = true;
      zellij.enable = true;
    };

    home.packages = with pkgs; [
      du-dust
    ];
  };
}
