local lspconfig = require("lspconfig")
local common = require('plugins.lsp.common');

return {
  ensure_installed = function()
    local rust_analyzer_executable = "rust-analyzer"
    if vim.fn.executable(rust_analyzer_executable) ~= 1 then
      vim.notify(
        string.format("%s not found in $PATH", rust_analyzer_executable),
        vim.log.levels.WARN
      )
    end
    return {
      setup = function()
        lspconfig.rust_analyzer.setup({
          on_attach = common
              .attach()
              .with_virtual_types()
              .build(),
        })
      end
    }
  end
}
