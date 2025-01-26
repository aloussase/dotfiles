vim.o.number = true
vim.o.signcolumn = 'yes'

-- Splitting
vim.o.splitbelow = true
vim.o.splitright = true

-- Indenting
vim.o.shiftwidth = 2
vim.o.shiftround = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

vim.cmd('colorscheme zaibatsu')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  install = { colorscheme = { "zaibatsu" } },
  spec = {
    {
      'ndmitchell/ghcid',
      config = function(plugin)
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
      "miikanissi/modus-themes.nvim", 
      priority = 1000,
      config = function()
        vim.cmd[[colorscheme modus_vivendi]]
      end
    },
    {
      'lunacookies/vim-colors-xcode',
      config = function()
        vim.cmd[[colorscheme xcodehc]]
      end
    },
    {
      'nvim-treesitter/nvim-treesitter',
      config = function()
        require('nvim-treesitter.configs').setup({
          ensure_installed = { 'go', 'haskell', 'lua' },
          auto_install = false,
          highlight = { enable = true },
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
    {
      "neovim/nvim-lspconfig",
      config = function()
        -- Some mappings that LSP sets by default
        -- grn -> rename
        -- gra -> code action
        -- grr -> references
        -- gO  -> document symbol
        -- C-S -> signature help

        local lspconfig = require('lspconfig')

        -- Language servers

        lspconfig.gopls.setup({})
        lspconfig.pylsp.setup({})

        vim.api.nvim_create_autocmd('LspAttach', {
          callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            -- TODO: Check from which version is this API available
            -- if client:supports_method('textDocument/completion') then
            --   vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
            -- end
            if client:supports_method('textDocument/formatting') then
              vim.api.nvim_create_autocmd('BufWritePre', {
                buffer = args.buf,
                callback = function()
                  vim.lsp.buf.format({bufnr = args.buf, id = client.id})
                end,
              })
            end
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
        require("noice").setup({
          presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
            inc_rename = false,
            lsp_doc_border = false,
          },
        })
      end
    }
  },
})
