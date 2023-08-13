local lspconfig = require('lspconfig')
local common = require("plugins.lsp.common")

return {
  ensure_installed = function()
    local ccls_executable = "ccls"
    if vim.fn.executable(ccls_executable) ~= 1 then
      vim.notify(
        string.format("%s not found in $PATH", ccls_executable),
        vim.log.levels.WARN
      )
    end
    return {
      setup = function()
        lspconfig.ccls.setup({
          on_attach =
              common
              .attach()
              .with_virtual_types()
              .with_signature_help()
              .build(),
          capabilities = common.capabilities,
        })
      end
    }
  end
}
