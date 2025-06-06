local globals = require("globals")

return {
    {
        'hrsh7th/cmp-nvim-lsp'
    },

    {
        'L3MON4D3/LuaSnip'
    },

    {
        'saadparwaiz1/cmp_luasnip'
    },

    {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require('cmp')
            local luasnip = require('luasnip')

            local compare = require('cmp.config.compare')
            local types = require('cmp.types')

            local sources_table = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
            }

            if globals.USE_COPILOT then
                table.insert(sources_table, { name = 'copilot' })
            end

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },

                -- how to sort sources
                sorting = {
                    comparators = {
                      compare.offset,
                      compare.exact,
                      compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
                      compare.kind,
                      compare.sort_text,
                      compare.length,
                      compare.order,
                      -- compare.locality,
                      -- compare.scopes,
                      -- compare.score_offset,
                      -- compare.recently_used,
                    },
                },

                sources = cmp.config.sources(sources_table),

                formatting = {
                    --fields = { "abbr", "menu", "kind" },
                    format = function(entry, item)
                        -- Set the fixed width of the completion menu.
                        local fixed_width = 40

                        -- Get the completion entry text shown in the completion window.
                        local content = item.abbr

                        -- Set the fixed completion window width.
                        vim.o.pumwidth = fixed_width
                        vim.o.pumheight = 10

                        -- Get the width of the current window.
                        local win_width = vim.api.nvim_win_get_width(0)

                        -- Set the max content width based on either: 'fixed_width'
                        -- or a percentage of the window width, in this case 20%.
                        -- We subtract 10 from 'fixed_width' to leave room for 'kind' fields.
                        local max_content_width = fixed_width and fixed_width - 10 or math.floor(win_width * 0.2)

                        -- Truncate the completion entry text if it's longer than the
                        -- max content width. We subtract 3 from the max content width
                        -- to account for the "..." that will be appended to it.
                        if #content > max_content_width then
                            item.abbr = vim.fn.strcharpart(content, 0, max_content_width - 3) .. "..."
                        else
                            item.abbr = content .. (" "):rep(max_content_width - #content)
                        end
                        return item
                    end
                },

                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                }),

                window = {
                    completion = cmp.config.window.bordered({
                        border = "shadow",
                        pumheight = 3,
                    }),

                    --documentation = cmp.config.window.bordered({
                    --border = "shadow",
                    --max_height = 3,
                    --}),
                },

                --performance = {max_view_entries = 3},
            })
        end
    },
}
