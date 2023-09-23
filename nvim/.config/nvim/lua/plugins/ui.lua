return {
  {
    "ellisonleao/carbon-now.nvim",
    lazy = true,
    cmd = "CarbonNow",
    opts = {
      options = {
        bg = "#222222",
        font_family = "HasklugNerdFontMono-Regular",
        theme = "one-dark",
        drop_shadow = true,
        titlebar = "",
      }
    }
  },
  {
    'brenoprata10/nvim-highlight-colors',
    opts = {
      render = "background",
      enable_tailwind = true,
    },
  },
  {
    'rcarriga/nvim-notify',
    config = function()
      local notify = require('notify')
      notify.setup({
        render = "compact",
        timeout = 1000,
      })
      vim.notify = notify
    end
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      vim.cmd [[highlight IdentBlankLineIndent1 guifg=#dddddd gui=nocombine]]
      require('indent_blankline').setup({
        char_highlight_list = {
          "IdentBlankLineIndent1"
        }
      })
    end
  },
  {
    "itchyny/lightline.vim",
    dependencies = { 'itchyny/vim-gitbranch' },
    config = function()
      vim.opt.laststatus = 3

      local fg = "#B3B1AD"
      local bg = "#0A0E14"

      local normal = "#E6B450"
      local insert = "#FF3333"
      local visual = "#F07178"
      local command = "#FF8F40"

      local mode_color = function(color)
        return {
          left = { { bg, color } },
          middle = { { fg, bg } },
          right = { { fg, bg } },
        }
      end

      local p = {
        normal = mode_color(normal),
        insert = mode_color(insert),
        visual = mode_color(visual),
        command = mode_color(command),
      }

      vim.g["lightline#colorscheme#ayu#palette"] = vim.fn["lightline#colorscheme#fill"](p)

      vim.g.lightline = {
        separator = { left = '', right = '' },
        subseparator = { left = '', right = '' },
        colorscheme = "ayu_light",
        active = {
          left = {
            { 'mode' },
            { 'gitbranch' },
            { 'filename' }
          },
          right = {
            { 'lineinfo',     'percent' },
            { 'fileencoding', 'filetype', 'fileformat' },
          }
        },
        component_function = {
          gitbranch = 'gitbranch#name'
        }
      }
    end
  },
  {
    'stevearc/dressing.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    opts = {
      select = {
        telescope = require('telescope.themes').get_dropdown()
      }
    },
  }
}
