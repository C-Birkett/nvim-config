if USE_COPILOT then
    return {
        {
            "zbirenbaum/copilot.lua",
            config = function()
                require("copilot").setup({
                    suggestion = {enabled = false},
                    panel = {enabled = false},
                })
            end,
        },

        {
            "zbirenbaum/copilot-cmp",
            dependencies = {
                "zbirenbaum/copilot.lua",
            },
            config = function()
                require("copilot_cmp").setup()
            end
        },

        {
            "CopilotC-Nvim/CopilotChat.nvim",
            dependencies = {
                { "zbirenbaum/copilot.lua" },
                { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
            },
            -- build = "make tiktoken", -- Only on MacOS or Linux
            opts = {
                sticky = {
                    "#files"
                }
            },
        },
    }
else
    return {}
end
