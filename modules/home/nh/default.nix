{
  lib,
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    nh
  ];

  home.sessionVariables = {
    NH_FLAKE = "${config.home.homeDirectory}/code/lesnov.me/nix-config"; # for nh
  };
}
