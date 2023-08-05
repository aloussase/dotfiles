vim.opt.swapfile      = false
vim.opt.backup        = false

vim.opt.backspace     = "indent,eol,start"
vim.opt.number        = true
vim.opt.tabstop       = 4
vim.opt.softtabstop   = 4
vim.opt.shiftwidth    = 4
vim.opt.shiftround    = true
vim.opt.expandtab     = true

vim.opt.laststatus    = 0
vim.opt.background    = "dark"
vim.opt.termguicolors = true
vim.opt.cursorline    = true

vim.opt.colorcolumn   = "80,100"

vim.opt.hlsearch      = true
vim.opt.ignorecase    = true
vim.opt.incsearch     = true
vim.opt.smartcase     = true

vim.opt.wildmenu      = true
vim.opt.wildmode      = "longest,list,full"

vim.opt.splitright    = true
vim.opt.splitbelow    = true

vim.opt.list          = true
vim.opt.listchars     = "eol:$"

vim.opt.autoindent    = true
vim.opt.smartindent   = true

vim.opt.mouse         = "a"
-- vim.opt.visualbell
vim.opt.signcolumn    = "yes"

vim.opt.hidden        = true

vim.opt.guifont       = "Hasklug Nerd Font Mono 12"

vim.opt.wrap          = false
vim.opt.viewdir       = "/tmp/view/"

local lazypath        = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig")
    end
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      height = 5,
      auto_open = true,
      auto_close = true,
      use_diagnostics_signs = true
    }
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
    },
    config = function()
      require('configs.cmp')
    end
  },
  {
    "olimorris/onedarkpro.nvim",
    config = function()
      vim.cmd("colorscheme onedark_dark")
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { "haskell" },
        highlight = { enable = true },
      })
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('configs.telescope')
    end
  }
})
