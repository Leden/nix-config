{
  lib,
  inputs,
  pkgs,
  mkShell,
  ...
}: let
  system = "x86_64-linux";

  inherit (inputs.self.checks.${system}) pre-commit;

  cmd-update-switch = pkgs.writeShellScriptBin ".update-switch" ''
    set -euo pipefail

    _git="${pkgs.git}/bin/git"
    _nh="${pkgs.nh}/bin/nh"
    _basename="${pkgs.coreutils}/bin/basename"

    default_branch="$( $_basename "$( $_git symbolic-ref refs/remotes/origin/HEAD )" )"

    if [ -n "$( $_git status --porcelain --untracked-files=no )" ]
    then
      printf '\033[31m !! Working copy is unclean. Commit or stash the changes first.\033[0m\n'
      exit 1
    fi

    $_git checkout "$default_branch"

    $_nh home switch -u

    $_git add flake.lock
    $_git commit -m "update inputs"
    $_git push
  '';
in
  mkShell {
    inherit (pre-commit) shellHook;
    buildInputs =
      pre-commit.enabledPackages
      ++ (
        with pkgs; [
          cmd-update-switch
        ]
      );
  }
