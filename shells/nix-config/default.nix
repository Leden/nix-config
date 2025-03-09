{
  lib,
  inputs,
  pkgs,
  mkShell,
  ...
}:
mkShell {
  packages = with pkgs; [
    nil # Nix LSP
    alejandra # Nix formatter
    statix # Nix linter
    pre-commit
  ];
}
