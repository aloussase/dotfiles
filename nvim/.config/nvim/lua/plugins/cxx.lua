return {
  {
    'rhysd/vim-clang-format',
    config = function()
      vim.g["clang_format#auto_format"] = true
    end
  }
}
