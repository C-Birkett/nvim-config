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
        dependencies = {
            'williamboman/mason.nvim',
        },
        lazy = false,
        opts = {auto_install = true},
        config = function()
            require("mason-lspconfig").setup({
                pip = {
                    upgrade_pip = true,
                },
                ensure_installed = {
                    -- ls
                    "clangd",
                    "csharp_ls",
                    "lua_ls",
                    "pyright",
                    "ts_ls",
                    "powershell_es",
                    --"pylsp",
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
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            require("lspconfig").clangd.setup({
                capabilities = capabilities,
                --on_attach = on_attach
            })

            require("lspconfig").csharp_ls.setup({
                capabilities = capabilities,
                --on_attach = on_attach
            })

            require("lspconfig").pyright.setup({
                capabilities = capabilities,
                --on_attach = on_attach
                python = {
                    pythonPath = vim.g.python3_host_prog
                }
            })

            require("lspconfig").ts_ls.setup({
                capabilities = capabilities,
                --on_attach = on_attach
            })

            require("lspconfig").powershell_es.setup({
                filetypes = {"ps1", "psm1", "psd1"},
                shell = "powershell.exe",
                bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services/",
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

            --[[
            require("lspconfig").pylsp.setup({
                capabilities = capabilities,
                --on_attach = on_attach
            })
            ]]

        end

    },
}
