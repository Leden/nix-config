{inputs, ...}: let
  system = "x86_64-linux";
in
  inputs.pre-commit-hooks.lib.${system}.run {
    src = ./.;
    hooks = {
      alejandra.enable = true;
      statix.enable = true;
    };
  }
