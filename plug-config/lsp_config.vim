lua << EOF

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {clangd},
    ensure_installed = {omnisharp},
})

require("lspconfig").clangd.setup {
    capabilities = capabilities,
    }

require("lspconfig").omnisharp.setup {
    on_attach = on_attach
    }

EOF
