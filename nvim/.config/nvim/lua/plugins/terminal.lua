return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 10,
        direction = "horizontal"
      })

      vim.keymap.set({ "n", "t" }, "<leader>tt", "<Cmd>ToggleTerm<CR>")
      vim.keymap.set("n", "<leader>ts", "<Cmd>TermSelect<CR>")

      vim.api.nvim_create_autocmd("TermOpen",
        {
          pattern = "term://*",
          callback = function(ev)
            local opts = { buffer = ev.buffer }
            vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
            vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
            vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
            vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
            vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
            vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
          end
        })
    end
  }
}
