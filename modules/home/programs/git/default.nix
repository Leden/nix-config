{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: let
  inherit (lib) mkEnableOption mkOption mkIf types;

  cfg = config.${namespace}.programs.git;
in {
  options.${namespace}.programs.git = {
    enable = mkEnableOption "Enable git";

    user.fullName = mkOption {
      type = types.str;
    };

    user.email = mkOption {
      type = types.str;
    };
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;

      settings = {
        user.name = cfg.user.fullName;
        user.email = cfg.user.email;

        alias = {
          br = "branch";
          ci = "commit";
          co = "checkout";
          cobr = "checkout master -b";
          d = "diff";
          dc = "diff --cached";
          g = "grep --break --heading --line-number";
          ign = "ls-files -o -i --exclude-standard";
          lg = "log -p";
          lol = "log --graph --decorate --pretty=oneline --abbrev-commit";
          lola = "log --graph --decorate --pretty=oneline --abbrev-commit --all";
          lor = "log --no-merges --graph --decorate --pretty=oneline --abbrev-commit development ^master";
          lora = "log --graph --decorate --pretty=oneline --abbrev-commit development ^master";
          ls = "ls-files";
          pu = "push -u origin HEAD";
          pf = "push --force-with-lease";
          rb = "branch --no-merged development --sort=-committerdate";
          st = "status";
          wtf = "log --graph -p -C1 --follow";
        };

        color = {
          ui = "auto";
          branch = "auto";
          diff = "auto";
          interactive = "auto";
          status = "auto";
        };

        push = {
          default = "upstream";
        };

        diff = {
          noprefix = true;
        };

        grep = {
          line-number = true;
        };

        init = {
          defaultBranch = "master";
        };
      };
    };
  };
}
