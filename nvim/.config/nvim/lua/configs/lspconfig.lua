local common = require("configs.lspconfig.common")
local trouble = require("trouble")

vim.fn.mkdir(common.language_servers_path, "p")

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

-- Navigate through trouble diagnostics.
vim.keymap.set('n', '[d', function() trouble.previous({ skip_groups = false, jump = true }) end)
vim.keymap.set('n', ']d', function() trouble.next({ skip_groups = false, jump = true }) end)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Omnicompletion
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Commands
    vim.api.nvim_buf_create_user_command(
      ev.buf,
      "Format",
      function() vim.lsp.buf.format { async = true } end,
      { desc = "Format the current buffer" }
    )

    -- Keybindings
    local opts = { buffer = ev.buf }
    -- GoTo Navigation
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    -- Documentation
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    -- Renaming
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    -- Code actions
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
  end,
})


require("configs.lspconfig.lua").ensure_installed().setup()
require("configs.lspconfig.haskell").ensure_installed().setup()
