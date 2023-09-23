return {
  { "olimorris/onedarkpro.nvim" },
  { 'Shatur/neovim-ayu' },
  { 'ramojus/mellifluous.nvim' },
  {
    'yorickpeterse/nvim-grey',
    config = function()
      vim.opt.background = "light"
      vim.cmd("colorscheme grey")
    end
  }
}
