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
                extensions = {"neo-tree", "mason", "lazy"},
                -- fix bad diagnostics icons
                sections = {
                    lualine_b = {
                        "branch",
                        "diff",
                        {
                            "diagnostics",
                            symbols = { error = '', warn = '', info = 'ⓘ', hint = '💡︎' },
                        }
                    },
                    lualine_y = {
                        {
                            "fileformat",
                            symbols = {
                                unix = "LF",
                                dos = "CRLF",
                                mac = "CR",
                            }
                        }
                    }
                }
            })
        end
    },

    {
        "shaunsingh/nord.nvim",
        config = function()
            vim.cmd.colorscheme("nord")
        end,
    },

    {
        "mhinz/vim-startify"
    }
}
