{pkgs, ...}: {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        lsp = {
          enable = true;
          formatOnSave = true;
          lightbulb.enable = true;
        };

        useSystemClipboard = false;

        languages = {
          enableLSP = true;
          enableFormat = true;
          enableTreesitter = true;

          nix.enable = true;
          html.enable = true;
          clang.enable = true;
          rust = {
            enable = true;
            crates.enable = true;
          };
          markdown.enable = true;
          tailwind.enable = true;
          # markdown.glow.enable = true;
          ts = {
            enable = true;
            lsp.enable = true;
            treesitter = {
              enable = true;
            };
          };
          go.enable = true;
          svelte.enable = true;
        };

        treesitter = {
          enable = true;
          grammars = with pkgs; [tree-sitter-grammars.tree-sitter-typescript tree-sitter-grammars.tree-sitter-templ];
        };

        extraPlugins = with pkgs.vimPlugins; {
          undodir = {
            package = undotree;
            setup = ''
              vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
              vim.opt.undofile = true
            '';
          };
        };

        optPlugins = ["plenary-nvim"];

        # vim.startPlugins = [pkgs.vimPlugins.undotree pkgs.vimPlugins.harpoon];

        preventJunkFiles = true;

        visuals = {
          nvimWebDevicons.enable = true;
          indentBlankline = {
            enable = true;
            setupOpts = {
              indent.char = " ";
              scope.enabled = true;
            };
          };
          highlight-undo.enable = true;
          # cursorline.enable = true;
          fidget-nvim.enable = true;
          # cursorWordline = {
          #   enable = true;
          #   lineTimeout = 0;
          # };
        };

        statusline = {
          lualine = {
            enable = true;
            theme = "catppuccin";
          };
        };

        binds = {
          whichKey.enable = true;
        };

        git = {
          enable = true;
          gitsigns.enable = true;
          # gitsigns.codeActions = true;
        };

        comments = {
          comment-nvim.enable = true;
        };

        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
          transparent = true;
        };
        autopairs.nvim-autopairs.enable = true;

        autocomplete.nvim-cmp = {
          enable = true;
        };

        telescope = {
          enable = true;
          mappings = {
            findFiles = "<leader>pf";
          };
        };

        tabline.nvimBufferline = {
          enable = true;
          mappings = {
            closeCurrent = "<leader>bx";
          };
        };

        ui = {
          breadcrumbs.enable = true;
          fastaction.enable = true;
        };

        maps = {
          normal = {
            # "<leader>pf" = {action = ":Telescope find_files<CR>";};
            # "<leader>p" = {action = "\"_dP";};
            "<leader>y" = {action = "\"+y";};
            "<leader>u" = {action = ":UndotreeToggle<CR>";};
            "<leader>f" = {action = ":lua vim.lsp.buf.format()<CR>";};
            "<leader>d" = {action = "\"_d";};
            # "<leader>a" = ":lua require(\"harpoon.mark\").add_file()<CR>";
            # "<leader>q" = ":lua require(\"harpoon.ui\").toggle_quick_menu()<CR>";
            "<leader>pv" = {action = ":E<CR>";};
            "<leader>q" = {action = ":lua require('harpoon'):list():append()<CR>";};
          };
          visual = {
            "<leader>y" = {action = "\"+y";};
            "<leader>p" = {action = "\"_dP";};
            "<leader>d" = {action = "\"_d";};
          };
        };
      };
    };
  };
}
