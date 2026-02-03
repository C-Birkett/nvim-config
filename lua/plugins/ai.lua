local globals = require("globals")

if globals.USE_COPILOT then

    return {
        {
            "NickvanDyke/opencode.nvim",
            config = function()
                vim.g.opencode_opts = {
                    provider = {
                        enabled = "terminal",
                    },
                }
                
                -- Required for opts.events.reload
                vim.o.autoread = true
            end
        },
    }

else
    return {}
end
