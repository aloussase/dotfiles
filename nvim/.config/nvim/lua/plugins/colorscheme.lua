return {
  { "olimorris/onedarkpro.nvim" },
  { 'Shatur/neovim-ayu' },
  { 'ramojus/mellifluous.nvim' },
  {
    'yorickpeterse/nvim-grey',
    config = function()
      vim.opt.background = "light"
      vim.cmd [[
      autocmd! ColorScheme grey hi Operator guifg=#662200
      colorscheme grey
      ]]
    end
  }
}
