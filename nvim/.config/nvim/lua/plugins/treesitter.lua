return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { "haskell", "lua", "cpp", "rust"},
        highlight = { enable = true },
      })
    end,
  },
}
