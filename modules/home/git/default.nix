{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: let
  user = lib.${namespace}.users.den-lesnov;
in {
  programs.git = {
    enable = true;

    userName = user.fullName;
    userEmail = user.email;

    aliases = {
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

    extraConfig = {
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
}
