local globals = require("globals")

return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            globals.USE_COPILOT and 'NickvanDyke/opencode.nvim' or nil,
        },
        config = function()
            local sections = {
                lualine_b = {
                    "branch",
                    "diff",
                    {
                        -- fix bad diagnostics icons
                        "diagnostics",
                        symbols = { error = '', warn = '', info = 'ⓘ', hint = '💡︎' },
                    }
                },
                lualine_x = {
                    'encoding',
                    'filetype',
                    {
                        'fileformat',
                        symbols = {
                            unix = " LF",
                            dos = " CRLF",
                            mac = " CR",
                        }
                    },
                    globals.USE_COPILOT and require("opencode").statusline or nil,
                }
            }

            require("lualine").setup({
                options = {
                    theme = "nord",
                    icons_enabled = true,
                },
                extensions = {"neo-tree", "mason", "lazy"},
                sections = sections
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
