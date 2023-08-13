return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/playground',
      'RRethy/nvim-treesitter-endwise',
      'abecodes/tabout.nvim',
    },
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { "haskell", "lua", "cpp", "rust" },
        highlight = { enable = true },
        playground = { enable = true },
        endwise = { enable = true },
      })

      require('tabout').setup({})
    end,
  },
}
