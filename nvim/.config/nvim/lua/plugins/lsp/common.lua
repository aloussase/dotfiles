return {
  language_servers_path = vim.fn.stdpath("data") .. "/language_servers",
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
}
