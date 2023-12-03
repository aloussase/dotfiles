return {
  { 'github/copilot.vim' },
  { "ChrisWellsWood/roc.vim" },
  {
    'akinsho/toggleterm.nvim', 
    version = "*", 
    config = function() 
      require('toggleterm').setup({
        size = 8,
      })

      -- Toggle terminal
      vim.keymap.set('n', '<leader>tt', '<Cmd>ToggleTerm<CR>', {})
      vim.keymap.set('t', '<leader>tt', '<Cmd>ToggleTerm<CR>', {})

      -- Move to and from the terminal
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], {})
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], {})
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], {})
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], {})
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], {})
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], {})
      vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], {})
    end
  },
}
