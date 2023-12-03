return {
  {
    "rebelot/kanagawa.nvim",
    config = function() end,
  },
  {
    'yorickpeterse/nvim-grey',
    config = function() end
  },
  {
    'marko-cerovac/material.nvim',
    config = function() end
  },
  {
    'olimorris/onedarkpro.nvim',
    config = function() end
  },
  {
    "Shatur/neovim-ayu",
    config = function()
      local ayu = require('ayu')
      ayu.setup({ mirage = true })
      ayu.colorscheme()
    end
  }
}
