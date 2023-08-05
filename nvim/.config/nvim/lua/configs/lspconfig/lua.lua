local lspconfig = require('lspconfig')
local common = require("configs.lspconfig.common")

local server_path = common.language_servers_path .. "/lua-language-server"
local server_executable = server_path .. "/bin/lua-language-server"

return {
  ensure_installed = function()
    local archive = "lua-language-server-3.6.25-linux-x64.tar.gz"
    local gh_release = "https://github.com/LuaLS/lua-language-server/releases/download/3.6.25/" .. archive
    local archive_download_path = "/tmp/" .. archive
    if not vim.loop.fs_stat(server_path) then
      vim.notify("Installing lua-language-server...")
      vim.fn.mkdir(server_path, "p")
      vim.fn.system({ "wget", gh_release, "-O", archive_download_path })
      vim.fn.system({ "tar", "xzvf", archive_download_path, "--directory", server_path })
      vim.notify(string.format(
        'lua-language-server installed, make sure %s is in your $PATH',
        server_executable
      ))
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
