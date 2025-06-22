{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: let
  inherit (lib) mkEnableOption mkOption mkIf types;

  cfg = config.${namespace}.programs.nixvim;
in {
  options.${namespace}.programs.nixvim = {
    enable = mkEnableOption "Enable nixvim";
  };

  config = mkIf cfg.enable {
    programs.nixvim = {
      enable = true;

      opts = {
        number = true; # Show line numbers
        relativenumber = true; # Show relative line numbers

        shiftwidth = 2; # Tab width should be 2
      };

      #vimAlias = true;
      enableMan = true;
      globals.mapleader = " ";

      lsp = {
        servers = {
          docker_compose_language_service.enable = true;
          dockerls.enable = true;
          html.enable = true;
        };
      };

      plugins = {
        oil.enable = true;
        web-devicons.enable = true;
        lsp.enable = true;
        markdown-preview.enable = true;
        gitsigns.enable = true;
        nvim-autopairs.enable = true;
        typescript-tools.enable = true;

        treesitter = {
          enable = true;

          settings = {
            highlight.enable = true;
          };
        };

        telescope = {
          enable = true;

          keymaps = {
            "<leader>bb" = {
              action = "buffers";
              options.desc = "Switch Buffers";
            };
            "<leader>ff" = {
              action = "find_files";
              options.desc = "Find Files";
            };
            "<leader>fg" = {
              action = "live_grep";
              options.desc = "Grep Files";
            };
          };

          extensions = {
            file-browser.enable = true;
          };
        };

        cmp = {
          autoEnableSources = true;
          settings.sources = [
            {name = "nvim_lsp";}
            {name = "path";}
            {name = "buffer";}
          ];
        };
      };
    };
  };
}
