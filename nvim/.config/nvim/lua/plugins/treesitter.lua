return {
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
        autotag = { enable = true }
      })
    end
  },
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
    'RRethy/nvim-treesitter-endwise'
  }
}
