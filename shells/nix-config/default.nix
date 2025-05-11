{
  lib,
  inputs,
  pkgs,
  mkShell,
  ...
}: let
  system = "x86_64-linux";
  inherit (inputs.self.checks.${system}) pre-commit;
in
  mkShell {
    inherit (pre-commit) shellHook;
    buildInputs = pre-commit.enabledPackages;
  }
