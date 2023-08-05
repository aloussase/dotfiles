return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')

      telescope.setup({
        defaults = {
          border = false,
          preview = false,
          layout_strategy = "vertical",
          layout_config = {
            vertical = {
              width = 0.5
            },
          },
        },
        pickers = {
          find_files = { theme = "dropdown" },
          live_grep = { theme = "dropdown" },
          buffers = { theme = "dropdown" },
        }
      })

      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    end
  },
}
