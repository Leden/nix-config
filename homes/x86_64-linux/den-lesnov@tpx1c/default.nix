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
}:

{
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    nh
    ripgrep
    zellij
    glow
    yt-dlp
    ollama
    python312
  ];

  home.sessionVariables = {
    EDITOR = "vim";
    FLAKE = "${config.home.homeDirectory}/code/lesnov.me/nix-config";  # for nh
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;

    userName = "Denis Lesnov";
    userEmail = "denis@lesnov.me";

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

      gui = {
        fontui = "-family Calibri -size 11 -weight normal -slant roman -underline 0 -overstrike 0";
        fontdiff = "-family Consolas -size 11 -weight normal -slant roman -underline 0 -overstrike 0";
      };

      push = {
        default = "upstream";
      };

      remote-hg = {
        hg-git-compat = true;
        track-branches = true;
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

  services.syncthing.enable = true;
}
