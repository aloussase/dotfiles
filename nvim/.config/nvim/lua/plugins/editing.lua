return {
  {
    'johmsalas/text-case.nvim',
    config = function()
      require('textcase').setup({})
      require('telescope').load_extension('textcase')
      vim.keymap.set('n', 'ga.', "<Cmd>Telescope textcase normal_mode theme=dropdown<CR>", {})
      vim.keymap.set('n', 'gal.', "<Cmd>Telescope textcase normal_mode_lsp_change theme=dropdown<CR>", {})
      vim.keymap.set('v', 'ga.', "<Cmd>Telescope textcase visual_mode theme=dropdown<CR>", {})
    end
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Completion symbols
      'onsails/lspkind.nvim',
      -- Completion sources
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    },
    config = function()
      local cmp = require('cmp')
      local lspkind = require('lspkind')

      cmp.setup({
        snippet = { expand = function() end },
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol',
            ellipsis_char = '...'
          })
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true })
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'path' },
          { name = 'buffer' },
        })
      })
    end
  }
}
