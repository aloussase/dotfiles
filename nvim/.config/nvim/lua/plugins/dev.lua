return {
  {
    dir = "~/Code/todogrep",
    config = function()
      require('todogrep').setup({
        auto_highlight = true,
      })
    end
  }
}
