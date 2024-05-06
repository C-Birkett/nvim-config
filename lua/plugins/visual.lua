return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "nord",
                    icons_enabled = true,
                },
                -- fix bad diagnostics icons
                sections = {
                    lualine_b = {
                        "branch",
                        "diff",
                        {
                            "diagnostics",
                            symbols = { error = '', warn = '', info = 'ⓘ', hint = '💡︎' },
                        }
                    }
                }
            })
        end
    },

    {
        "gbprod/nord.nvim",
        config = function()
            require("nord").setup({})
            vim.cmd.colorscheme("nord")
        end,
    },

    {
        "mhinz/vim-startify"
    }
}
