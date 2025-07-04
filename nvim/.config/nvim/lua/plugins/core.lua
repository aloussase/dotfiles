return {
  { "nvim-lua/plenary.nvim" },
  { 'echasnovski/mini.test', version = '*' },
  {
    'natecraddock/workspaces.nvim',
    config = function()
      require('workspaces').setup({
        auto_open = true,
        hooks = {
          open = 'NvimTreeOpen'
          ,
        },
      })
    end
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      vim.keymap.set('n', '<leader>tt', '<Cmd>ToggleTerm<CR>', { desc = 'Toggle terminal' })

      vim.api.nvim_create_autocmd({ "TermEnter" }, {
        pattern = "term://*toggleterm#*",
        command = "tno <silent><leader>tt <Cmd>ToggleTerm<CR>"
      })

      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
      end

      vim.api.nvim_create_autocmd({ "TermEnter" }, {
        pattern = "term://*toggleterm#*",
        command = "lua set_terminal_keymaps()"
      })

      require("toggleterm").setup({
        shade_terminals = false,
      })
    end
  },
}
