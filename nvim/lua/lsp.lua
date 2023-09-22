local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
lspconfig.pyright.setup {
    capabilities = capabilities
}
lspconfig.lus_ls.setup {
    capabilities = capabilities
}
lspconfig.rust_analyzer.setup {
    capabilities = capabilities
}
