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

  ${namespace} = {
    roles = {
      core.enable = true;
      development.enable = true;
      media.enable = true;
    };

    programs.git.user = config.${namespace}.users.den-lesnov;
  };
}
