local lspconfig = require('lspconfig')
local common = require("plugins.lsp.common")

return {
  ensure_installed = function()
    local lua_ls_executable = "lua-language-server"
    if vim.fn.executable(lua_ls_executable) ~= 1 then
      vim.notify(
        string.format("%s is not found in $PATH", lua_ls_executable),
        vim.log.levels.WARN
      )
    end
    return {
      setup = function()
        lspconfig.lua_ls.setup({
          capabilities = common.capabilities,
          settings = {
            Lua = {
              diagnostics = {
                globals = { 'vim' }
              }
            }
          }
        })
      end
    }
  end
}
