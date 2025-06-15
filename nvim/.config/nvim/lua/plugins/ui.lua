return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require('notify').setup({
        timeout = 1000,
        max_width = 40,
        top_down = false,
        render = "wrapped-compact",
      })
    end
  },
}
