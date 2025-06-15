return {
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      vim.keymap.set("n", "<leader>x", "<Cmd>NvimTreeToggle<CR>", {})

      require('nvim-tree').setup({
        view = {
          width = 30,
          side = "right",
        },
        renderer = {
          root_folder_label = false,
          group_empty = true,
          indent_width = 1,
        }
      })
    end
  },
}
