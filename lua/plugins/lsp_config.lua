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
                ensure_installed = {
                    -- ls
                    "clangd",
                    "omnisharp",
                    "lua_ls",
                    -- lint
                    --"cmakelint",
                    --"pylint",
                },
            })
        end
    },

    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = {
                    -- format
                    "stylua",
                }
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
                --on_attach = on_attach
            })

            require("lspconfig").omnisharp.setup({
                capabilities = capabilities,
                --on_attach = on_attach
            })

            require("lspconfig").lua_ls.setup({
                capabilities = capabilities,
                --on_attach = on_attach,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {"vim"}
                        }
                    }
                }
            })
        end

    },
}
