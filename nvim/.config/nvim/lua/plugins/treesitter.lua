return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { "haskell", "lua", "cpp" },
        highlight = { enable = true },
      })
    end,
  },
}
