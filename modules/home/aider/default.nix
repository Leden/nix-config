{
  lib,
  pkgs,
  config,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    aider-chat.withPlaywright
  ];

  home.file = {
    ".aider.conf.yml".text = lib.generators.toYAML {} {
      # env file with API keys is managed manually
      env-file = "${config.home.homeDirectory}/.aider.env";

      # dark theme
      dark-mode = true;

      # vim-mode input
      vim = true;

      # default mode (ask | code | help)
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
}
