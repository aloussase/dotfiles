return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'jubnzv/virtual-types.nvim',
      'ray-x/lsp_signature.nvim',
      {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
      }
    },
    config = function()
      local common = require("plugins.lsp.common")

      vim.fn.mkdir(common.language_servers_path, "p")

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Omnicompletion
          -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Commands
          vim.api.nvim_buf_create_user_command(
            ev.buf,
            "Format",
            function() vim.lsp.buf.format { async = true } end,
            { desc = "Format the current buffer" }
          )

          -- Autocmds
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = ev.buf,
            desc = "Format buffer on save",
            callback = function()
              vim.lsp.buf.format({ async = false })
            end
          })

          -- Diganostics
          --
          vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

          -- Keybindings
          --
          local opts = { buffer = ev.buf }

          -- GoTo Navigation
          --
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)

          -- Documentation
          --
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

          -- Renaming
          --
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

          -- Code actions
          --
          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        end,
      })

      require("plugins.lsp.lua").ensure_installed().setup()
      require("plugins.lsp.haskell").ensure_installed().setup()
      require("plugins.lsp.cpp").ensure_installed().setup()
      require("plugins.lsp.rust").ensure_installed().setup()
    end
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local trouble = require("trouble")
      vim.keymap.set('n', '[d', function() trouble.previous({ skip_groups = false, jump = true }) end)
      vim.keymap.set('n', ']d', function() trouble.next({ skip_groups = false, jump = true }) end)
      trouble.setup({
        height = 5,
        auto_open = true,
        auto_close = true,
        use_diagnostics_signs = true
      })
    end
  },
}
