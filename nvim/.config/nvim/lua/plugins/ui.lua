return {
  {
    "ellisonleao/carbon-now.nvim",
    lazy = true,
    cmd = "CarbonNow",
    opts = {
      options = {
        bg = "#222222",
        font_family = "HasklugNerdFontMono-Regular",
        theme = "one-dark",
        drop_shadow = true,
        titlebar = "",
      }
    }
  },
  {
    'brenoprata10/nvim-highlight-colors',
    opts = {
      render = "first_column",
      enable_tailwind = true,
    },
  },
  {
    'rcarriga/nvim-notify',
    config = function()
      local notify = require('notify')
      notify.setup({
        render = "compact",
        timeout = 1000,
      })
      vim.notify = notify
    end
  }
}
