return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        config = function()
            local config = require("nvim-treesitter.configs")
            config.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python" },
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    }
}
