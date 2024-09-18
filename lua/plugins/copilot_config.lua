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
    }
else
    return {}
end
