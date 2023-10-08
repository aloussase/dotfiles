return {
  { 'projekt0n/github-nvim-theme' },
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
