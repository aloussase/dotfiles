return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/playground',
      'RRethy/nvim-treesitter-endwise',
      'windwp/nvim-ts-autotag',
    },
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          "haskell",
          "lua",
          "cpp",
          "rust",
          "javascript",
          "typescript",
          "vue" 
        },
        highlight = { enable = true },
        playground = { enable = true },
        query_linter = {
          enable = true,
          use_virtual_text = true,
        },
        endwise = { enable = true },
        autotag = {
          enable = true,
          enable_rename = true,
          enable_close = true,
          enable_close_on_slash = true,
        }
      })
    end,
  },
}
