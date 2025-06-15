{
  lib,
  pkgs,
  inputs,
  config,
  namespace,
  home,
  target,
  format,
  virtual,
  host,
  ...
}: {
  home = {
    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "24.05"; # Please read the comment before changing.

    packages = with pkgs; [
      # Desktop
      firefox
      xdotool

      # AI
      ollama

      # Gaming
      (python312.withPackages (ps: with ps; [wxpython]))
      protontricks
      gfn-electron

      # Money
      wasabiwallet
    ];

    sessionVariables = {
      EDITOR = "vim";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  services.syncthing.enable = true;

  ${namespace} = {
    roles = {
      core.enable = true;
      development.enable = true;
    };
  };
}
