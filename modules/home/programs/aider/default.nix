{
  lib,
  pkgs,
  config,
  inputs,
  namespace,
  ...
}: let
  inherit (lib) mkEnableOption mkOption mkIf types;
  cfg = config.${namespace}.programs.aider;
in {
  options.${namespace}.programs.aider = {
    enable = mkEnableOption "Enable aider";

    package = mkOption {
      type = types.package;
      default = pkgs.aider-chat;
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      cfg.package
    ];

    home.file = {
      ".aider.conf.yml".text = lib.generators.toYAML {} {
        # env file with API keys is managed manually
        # TODO: sops it!
        env-file = "${config.home.homeDirectory}/.aider.env";

        # dark theme
        dark-mode = true;

        # vim-mode input
        vim = true;

        # default mode (ask | architect | code | help)
        chat-mode = "ask";

        # disable automatic linting
        auto-lint = false;

        # git
        show-diffs = true;
        auto-commits = false;

        # do not check for updates at startup
        check-update = false;

        # default model
        model = "r1";

        # model aliases
        alias = [
          "sonnet:openrouter/anthropic/claude-sonnet-4"
          "haiku:openrouter/anthropic/claude-3.5-haiku"
          "r1:openrouter/deepseek/deepseek-r1-0528"
          "o4:openrouter/openai/o4-mini-high"
        ];
      };
    };
  };
}
