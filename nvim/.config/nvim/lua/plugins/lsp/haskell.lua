local lspconfig = require("lspconfig")
local common = require('plugins.lsp.common');

return {
  ensure_installed = function()
    local hls_executable_name = "haskell-language-server-wrapper"
    local cabalfmt_executable_name = "cabal-fmt"
    local stylish_haskell_executable_name = "stylish-haskell"
    if vim.fn.executable(hls_executable_name) ~= 1 then
      vim.notify(
        string.format("%s not found in $PATH", hls_executable_name),
        vim.log.levels.WARN
      )
    end
    if vim.fn.executable(cabalfmt_executable_name) ~= 1 then
      vim.notify(
        string.format("%s not found in $PATH", cabalfmt_executable_name),
        vim.log.levels.WARN
      )
    end
    if vim.fn.executable(stylish_haskell_executable_name) ~= 1 then
      vim.notify(
        string.format("%s not found in $PATH", stylish_haskell_executable_name),
        vim.log.levels.WARN
      )
    end
    return {
      setup = function()
        lspconfig.hls.setup({
          on_attach = common
              .attach()
              .with_signature_help()
              .build(),
          capabilities = common.capabilities,
          filetypes = { "haskell", "cabal" },
          settings = {
            haskell = {
              cabalFormattingProvider = "cabalfmt",
              formattingProvider = "stylish-haskell",
            }
          }
        })
      end
    }
  end
}
