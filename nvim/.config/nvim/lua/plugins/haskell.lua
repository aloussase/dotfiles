return {
  { "nbouscal/vim-stylish-haskell" },
  {
    "ndmitchell/ghcid",
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/plugins/nvim")
    end
  }
}
