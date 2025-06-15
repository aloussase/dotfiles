return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')

      -- Language servers

      lspconfig.gopls.setup({})
      lspconfig.templ.setup({})

      lspconfig.pylsp.setup({})
      lspconfig.svelte.setup({})

      -- npm install -g typescript typescript-language-server
      lspconfig.ts_ls.setup({})

      -- npm install -g @elm-tooling/elm-language-server
      -- npm install -g elm elm-test elm-format
      -- npm install -g elm-review
      lspconfig.elmls.setup({})

      lspconfig.gleam.setup({})

      lspconfig.hls.setup({
        filetypes = { 'haskell', 'lhaskell', 'cabal' },
        cmd = { 'haskell-language-server-9.4.8~2.10.0.0', '--lsp' },
        settings = {
          haskell = {
            formattingProvider = "stylish-haskell",
            cabalFormattingProvider = "cabal-fmt",
            plugin = {
              eval = { globalOn = true },
              ['ghcide-code-actions-imports-exports'] = { globalOn = true },
              hlint = { globalOn = true },
              rename = { globalOn = true },
            }
          },
        },
      })

      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            },
            diagnostics = {
              globals = { 'vim' },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      -- brew install rust-analyzer
      lspconfig.rust_analyzer.setup({})

      lspconfig.ccls.setup({
        init_options = {
          compilationDatabaseDirectory = "build"
        }
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)

          if client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end

          vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { buffer = args.buf })
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = args.buf })
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = args.buf })
          vim.keymap.set('n', '<leader>rr', vim.lsp.buf.references, { buffer = args.buf })
          vim.keymap.set(
            'n',
            '<leader>tih',
            function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
            { buffer = args.buf })
        end,
      })
    end
  },

}
