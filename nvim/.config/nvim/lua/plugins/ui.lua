return {
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
  },
  {
    'stevearc/dressing.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    opts = {
      select = {
        telescope = require('telescope.themes').get_dropdown()
      }
    },
  }
}
