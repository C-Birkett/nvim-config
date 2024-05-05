return {
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = function()
            require("mason").setup()
        end
    },

    {
        'williamboman/mason-lspconfig.nvim',
        lazy = false,
        opts = {auto_install = true},
        config = function()
            require("mason-lspconfig").setup({
            ensure_installed = {clangd},
            ensure_installed = {omnisharp},
            ensure_installed = {lua_ls},
            })
        end
    },

    {
        'neovim/nvim-lspconfig',
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            require("lspconfig").clangd.setup({
                capabilities = capabilities,
                on_attach = on_attach
            })

            require("lspconfig").omnisharp.setup({
                capabilities = capabilities,
                on_attach = on_attach
            })

            require("lspconfig").lua_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        end

    },
}
