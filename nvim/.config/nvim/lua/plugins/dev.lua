return {
  {
    dir = "~/Code/todogrep",
    config = function()
      require('todogrep').setup({
        auto_highlight = true,
      })
    end
  },
  { dir = "~/Code/dockerlint.nvim" },
  { dir = "~/Code/gaya-lang/editors/vim" }
}
