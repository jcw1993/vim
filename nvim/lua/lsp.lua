local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
lspconfig.pyright.setup {
    capabilities = capabilities
}
lspconfig.lua_ls.setup {
    capabilities = capabilities
}
lspconfig.rust_analyzer.setup {
    capabilities = capabilities
}
lspconfig.clangd.setup {
    capabilities = capabilities
}
lspconfig.jdtls.setup {
    capabilities = capabilities,
    --handlers = {
        --["$/progress"] = vim.schedule_wrap(on_language_status),
    --},
}
lspconfig.kotlin_language_server.setup {
    capabilities = capabilities
}

local function on_language_status(_, result)
  -- Ignore nil messages.
  if result.message == nil then
      return
  end
  local command = vim.api.nvim_command
  command 'echohl ModeMsg'
  command(string.format('echo "%s"', result.message))
  command 'echohl None'
end
