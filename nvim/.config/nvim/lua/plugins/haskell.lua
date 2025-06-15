return {
  {
    'ndmitchell/ghcid',
    config = function(plugin)
      vim.g.ghcid_keep_open = true
      vim.g.ghcid_placement = 'below'
      vim.opt.rtp:append(plugin.dir .. "/plugins/nvim")
    end
  },
  { "nbouscal/vim-stylish-haskell" },
}
