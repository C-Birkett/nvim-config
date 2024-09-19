return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    ---@param ctx { mode: string, operator: string }
    defer = function(ctx)
      return ctx.mode == "V" or ctx.mode == "<C-V>" or ctx.mode == "v"
    end,
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Keymaps",
    },
  },
}
