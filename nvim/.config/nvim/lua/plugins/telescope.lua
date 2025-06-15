return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })

      telescope.setup({
        defaults = {
          sorting_strategy = "ascending",
          -- layout_strategy = "bottom_pane",
          layout_strategy = "grey",
          layout_config = {
            prompt_position = "top"
          },
          wrap_results = true,
          preview = false,
        }
      })

      telescope.load_extension('grey')
    end
  },
}
