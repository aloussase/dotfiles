vim.o.number = true
vim.o.signcolumn = 'yes'

-- Splitting
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.wrap = false

-- Indenting
vim.o.shiftwidth = 2
vim.o.shiftround = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

-- Statusline
vim.o.laststatus = 0
vim.o.termguicolors = true
vim.cmd('colorscheme wildcharm')

-- Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  install = {},
  spec = {
    {
      'ndmitchell/ghcid',
      config = function(plugin)
        vim.g.ghcid_keep_open = true
        vim.g.ghcid_placement = 'below'
        vim.opt.rtp:append(plugin.dir .. "/plugins/nvim")
      end
    },
    {
      "nbouscal/vim-stylish-haskell"
    },
    {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.8',
      branch = '0.1.x',
      dependencies = {
        'nvim-lua/plenary.nvim',
      },
      config = function()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })

        telescope.setup({
          defaults = {
            sorting_strategy = "ascending",
            layout_strategy = "bottom_pane",
            wrap_results = true,
            preview = false,
          }
        })
      end
    },
    {
      'nvim-treesitter/nvim-treesitter',
      dependencies = {
        'nvim-tree/nvim-web-devicons'
      },
      config = function()
        require('nvim-treesitter.configs').setup({
          ensure_installed = { 'go', 'haskell', 'lua', 'tsx', 'typescript' },
          auto_install = false,
          highlight = { enable = true },
          -- autotag = { enable = true }
        })
      end
    },
    {
      'nvim-tree/nvim-tree.lua',
      config = function()
        vim.keymap.set("n", "<leader>x", "<Cmd>NvimTreeToggle<CR>", {})

        require('nvim-tree').setup({
          view = {
            width = 30,
            side = "right",
          },
          renderer = {
            root_folder_label = false,
            group_empty = true,
            indent_width = 1,
          }
        })
      end
    },
    {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup({
          signcolumn = true,
          current_line_blame = true,
        })
      end
    },
    { "rhysd/vim-clang-format" },
    {
      "neovim/nvim-lspconfig",
      config = function()
        local lspconfig = require('lspconfig')

        -- Language servers

        lspconfig.gopls.setup({})
        lspconfig.templ.setup({})

        lspconfig.pylsp.setup({})
        lspconfig.svelte.setup({})

        -- npm install -g typescript typescript-language-server
        lspconfig.ts_ls.setup({})

        -- npm install -g @elm-tooling/elm-language-server
        -- npm install -g elm elm-test elm-format
        -- npm install -g elm-review
        lspconfig.elmls.setup({})

        lspconfig.gleam.setup({})

        lspconfig.lua_ls.setup({
          settings = {
            Lua = {
              runtime = {
                version = 'LuaJIT',
              },
              diagnostics = {
                globals = { 'vim' },
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
              },
              telemetry = {
                enable = false,
              },
            },
          },
        })

        -- brew install rust-analyzer
        lspconfig.rust_analyzer.setup({})

        lspconfig.ccls.setup({
          init_options = {
            compilationDatabaseDirectory = "build"
          }
        })

        vim.api.nvim_create_autocmd('LspAttach', {
          callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)

            if client:supports_method('textDocument/formatting') then
              vim.api.nvim_create_autocmd('BufWritePre', {
                buffer = args.buf,
                callback = function()
                  vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                end,
              })
            end

            vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { buffer = args.buf })
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = args.buf })
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = args.buf })
            vim.keymap.set('n', '<leader>rr', vim.lsp.buf.references, { buffer = args.buf })
            vim.keymap.set(
              'n',
              '<leader>tih',
              function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
              { buffer = args.buf })
          end,
        })
      end
    },
    {
      "folke/noice.nvim",
      event = "VeryLazy",
      dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
      },
      config = function()
        require('notify').setup({
          timeout = 1000,
          max_width = 40,
          top_down = false,
          render = "wrapped-compact",
        })
      end
    },
    { 'github/copilot.vim' },
    {
      'windwp/nvim-ts-autotag',
      config = function()
        require('nvim-ts-autotag').setup({
          opts = {
            enable_close = true,
            enable_rename = true,
          },
        })
      end
    },
    {
      'akinsho/toggleterm.nvim', 
      version = "*", 
      config = function()
        vim.keymap.set('n', '<leader>tt', '<Cmd>ToggleTerm<CR>', { desc = 'Toggle terminal' })

        vim.api.nvim_create_autocmd({"TermEnter"}, {
          pattern = "term://*toggleterm#*",
          command = "tno <silent><leader>tt <Cmd>ToggleTerm<CR>"
        })

        function _G.set_terminal_keymaps()
          local opts = {buffer = 0}
          vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
          vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
          vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
          vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
          vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
          vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
          vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
        end

        vim.api.nvim_create_autocmd({"TermEnter"}, {
          pattern = "term://*toggleterm#*",
          command = "lua set_terminal_keymaps()"
        })

        require("toggleterm").setup({
          shade_terminals = false,
        })
      end
    },
  }
})

