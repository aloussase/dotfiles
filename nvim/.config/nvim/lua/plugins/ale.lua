return {
  {
    'dense-analysis/ale',
    lazy = true,
    config = function()
      -- Linting
      vim.g.ale_linters_explicit           = 1

      -- Diagnostics
      vim.g.ale_use_neovim_diagnostics_api = 1
      vim.g.ale_open_list                  = 0
      vim.g.ale_keep_list_window_open      = 0
      vim.g.ale_list_window_size           = 5

      -- UI
      vim.g.ale_floating_preview       = 1
      vim.g.ale_floating_window_border = {'│', '─', '╭', '╮', '╯', '╰', '│', '─'}

      -- Formatting
      vim.g.ale_fix_on_save = 1
      
      -- Completion
      vim.g.ale_completion_enable = 1
      vim.opt.omnifunc = "ale#completion#OmniFunc"

      -- Keybindings
      vim.keymap.set("n", "<leader>rn", "<Cmd>ALERename<CR>", {silent=true})
      vim.keymap.set("n", "<leader>e", "<Cmd>ALEDetail<CR>", {silent=true})
      vim.keymap.set("n", "K", "<Cmd>ALEHover<CR>", {silent=true})

      vim.g.ale_enabled = 0
    end
  }
}
