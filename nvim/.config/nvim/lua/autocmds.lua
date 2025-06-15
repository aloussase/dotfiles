vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  desc = "Highlight on yank",
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})
