return {
  {
    'johmsalas/text-case.nvim',
    config = function()
      require('textcase').setup({})
      require('telescope').load_extension('textcase')
      vim.keymap.set('n', 'ga.', "<Cmd>Telescope textcase normal_mode theme=dropdown<CR>", {})
      vim.keymap.set('v', 'ga.', "<Cmd>Telescope textcase visual_mode theme=dropdown<CR>", {})
    end
  },
}
