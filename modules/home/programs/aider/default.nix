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

        # git
        show-diffs = true;
        auto-commits = false;

        # do not check for updates at startup
        check-update = false;

        # default model
        model = "local";

        # model aliases
        alias = [
          "local:ollama_chat/qwen2.5-coder:1.5b"
          "smart:openrouter/deepseek/deepseek-r1"
          "fast:openrouter/anthropic/claude-3-5-haiku"
          "hacker:openrouter/anthropic/claude-3.7-sonnet"
        ];
      };
    };
  };
}
