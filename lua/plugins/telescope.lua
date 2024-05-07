return {

    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "jonarrien/telescope-cmdline.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
        },
        keys = {
            { ':', '<cmd>Telescope cmdline<cr>', desc = 'Cmdline' }
        },
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })

            require("telescope").load_extension("ui-select")
            require("telescope").load_extension("cmdline")
        end,
    },
}
