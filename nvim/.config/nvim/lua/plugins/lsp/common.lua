local function new_attach_callback()
  local o = {}

  o.with_virtual_types = function()
    o[#o + 1] = function(client, bufnr)
      require('virtualtypes').on_attach(client, bufnr)
    end
    return o
  end

  o.build = function()
    return function(client, bufnr)
      require("fidget").setup({})
      for _, ext in ipairs(o) do
        ext(client, bufnr)
      end
    end
  end

  return o
end

return {
  language_servers_path = vim.fn.stdpath("data") .. "/language_servers",
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  attach = new_attach_callback,
}
