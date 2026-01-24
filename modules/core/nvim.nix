{
  pkgs,
  ...
}:

{

  home-manager.users.axiom.programs.neovim = {
    enable = true;
    defaultEditor = false; # this is configured by me elsewhere
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      mini-nvim
      onedark-nvim
      guess-indent-nvim
      todo-comments-nvim
      conform-nvim
      nvim-web-devicons
      which-key-nvim
    ];

    extraLuaConfig = # lua
      ''
        vim.cmd.colorscheme 'onedark'
        vim.g.have_nerd_font = true
        vim.o.number = true
        vim.o.mouse = 'a'
        vim.o.showmode = false
        vim.schedule(function()
          vim.o.clipboard = 'unnamedplus'
        end)
        vim.o.breakindent = true
        vim.o.undofile = true
        vim.o.ignorecase = true
        vim.o.smartcase = true
        vim.o.signcolumn = 'yes'
        vim.o.updatetime = 250
        vim.o.timeoutlen = 300
        vim.o.splitright = true
        vim.o.splitbelow = true
        vim.o.list = true
        vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
        -- preview repalce
        vim.o.inccommand = 'split'
        vim.o.cursorline = true
        vim.o.scrolloff = 10
        vim.o.confirm = true
        vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
        vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', {desc = 'exit terminal mode'})

        vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
        vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
        vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
        vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

         require('mini.ai').setup { n_lines = 500 }
         require('mini.surround').setup()

         local statusline = require 'mini.statusline'
         statusline.setup { use_icons = vim.g.have_nerd_font }

        ---@diagnostic disable-next-line: deplicate-set-field
        statusline.section_location = function()
          return '%2l:%-2v'
        end

        require('nvim-treesitter.configs').setup {
          highlight = {
            enable = true,
            -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
            --  If you are experiencing weird indenting issues, add the language to
            --  the list of additional_vim_regex_highlighting and disabled languages for indent.
            additional_vim_regex_highlighting = { 'ruby' },
          },
          indent = { enable = true, disable = { 'ruby' } },
        }

        require("conform").setup({
          notify_on_error = false,
          format_on_save = function(bufnr)
            -- Disable "format_on_save lsp_fallback" for languages that don't
            -- have a well standardized coding style. You can add additional
            -- languages here or re-enable it for the disabled ones.
            local disable_filetypes = { c = true, cpp = true }
            if disable_filetypes[vim.bo[bufnr].filetype] then
              return nil
            else
              return {
                timeout_ms = 500,
                lsp_format = 'fallback',
              }
            end
          end,
          formatters_by_ft = {
            lua = { 'stylua' },
            -- Conform can also run multiple formatters sequentially
            -- python = { "isort", "black" },
            --
            -- You can use 'stop_after_first' to run the first available formatter from the list
            -- javascript = { "prettierd", "prettier", stop_after_first = true },
          },
        })

        require("nvim-web-devicons").setup()

        require("which-key").setup({
          -- delay between pressing a key and opening which-key (milliseconds)
          -- this setting is independent of vim.o.timeoutlen
          delay = 0,
          icons = {
            -- set icon mappings to true if you have a Nerd Font
            mappings = vim.g.have_nerd_font,
            -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
            -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
            keys = vim.g.have_nerd_font and {} or {
              Up = '<Up> ',
              Down = '<Down> ',
              Left = '<Left> ',
              Right = '<Right> ',
              C = '<C-…> ',
              M = '<M-…> ',
              D = '<D-…> ',
              S = '<S-…> ',
              CR = '<CR> ',
              Esc = '<Esc> ',
              ScrollWheelDown = '<ScrollWheelDown> ',
              ScrollWheelUp = '<ScrollWheelUp> ',
              NL = '<NL> ',
              BS = '<BS> ',
              Space = '<Space> ',
              Tab = '<Tab> ',
              F1 = '<F1>',
              F2 = '<F2>',
              F3 = '<F3>',
              F4 = '<F4>',
              F5 = '<F5>',
              F6 = '<F6>',
              F7 = '<F7>',
              F8 = '<F8>',
              F9 = '<F9>',
              F10 = '<F10>',
              F11 = '<F11>',
              F12 = '<F12>',
            },
          },

          -- Document existing key chains
          spec = {
            { '<leader>s', group = '[S]earch' },
            { '<leader>t', group = '[T]oggle' },
            { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
          },
        })



        -- The line beneath this is called `modeline`. See `:help modeline`
        -- vim: ts=2 sts=2 sw=2 et

      '';
  };

  environment.systemPackages = with pkgs; [
    sqlite # for coq nvim completion
    universal-ctags # for coq nvim completion
    python310 # for coq setup
    python310Packages.virtualenv
    # lua lsp for vim config
    lua-language-server
    # for nvim
    gcc
  ];

  # env.VIMINIT = "let \\$MYVIMRC='\\$XDG_CONFIG_HOME/nvim/init.lua' | source \\$MYVIMRC";

  environment.shellAliases = {
    nvim = "nvim -u ~/.config/nvim/init.lua";
    vim = "nvim -u ~/.config/nvim/init.lua";
    vi = "nvim -u ~/.config/nvim/init.lua";
    v = "nvim -u ~/.config/nvim/init.lua";
  };
}
