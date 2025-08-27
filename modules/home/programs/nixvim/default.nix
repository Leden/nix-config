{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.${namespace}.programs.nixvim;
in {
  options.${namespace}.programs.nixvim = {
    enable = mkEnableOption "Enable nixvim";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      # for ts_ls
      typescript
      typescript-language-server
    ];

    programs.nixvim = {
      enable = true;

      opts = {
        number = true; # Show line numbers
        relativenumber = true; # Show relative line numbers

        shiftwidth = 2; # Tab width should be 2

        # Highlight cursor row & column
        cursorline = true;
        cursorcolumn = true;
      };

      #vimAlias = true;
      enableMan = true;
      globals.mapleader = " ";

      lsp = {
        servers = {
          cssls.enable = true;
          docker_compose_language_service.enable = true;
          dockerls.enable = true;
          dotls.enable = true;
          eslint.enable = true;
          helmls.enable = true;
          html.enable = true;
          nginx_language_server.enable = true;
          nil_ls.enable = true;
          nixd.enable = true;
          pylsp.enable = true;
          ruff.enable = true;
          rust_analyzer.enable = true;
          sqls.enable = true;
          statix.enable = true;
          ts_ls.enable = true;
          ttags.enable = true;
          typos_lsp.enable = true;
          yamlls.enable = true;
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

          grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
            awk
            bash
            css
            csv
            desktop
            diff
            dockerfile
            dot
            dtd
            editorconfig
            git_config
            git_rebase
            gitattributes
            gitcommit
            gitignore
            gpg
            graphql
            hcl
            helm
            html
            htmldjango
            http
            ini
            javascript
            jinja
            jq
            json
            lua
            make
            markdown
            markdown_inline
            mermaid
            nginx
            nix
            passwd
            printf
            python
            regex
            requirements
            rust
            scss
            sql
            ssh_config
            terraform
            toml
            tsv
            tsx
            typescript
            vim
            vimdoc
            xml
            yaml
          ];
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
