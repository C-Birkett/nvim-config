-- assorted macros, either my own or borrowed

-- date stamp
--nnoremap <F4> "=strftime('%d/%m/%Y')<CR>P
--inoremap <F4> <C-R>=strftime('%d/%m/%Y')<CR>

-- Compile and open/run

--nnoremap <F6> :w % <Bar> ! ~/.config/nvim/plug-config/buildWikiPDF "%:p" <CR>

-- split resizing
--vim.keymap.set(<silent> <C-Left> :vertical resize -3<CR>
--noremap <silent> <C-Right> :vertical resize +3<CR>
--noremap <silent> <C-Up> :resize -3<CR>
--noremap <silent> <C-Down> :resize +3<CR>

-- which-key groups
local wk = require("which-key")
wk.add({
    { "<leader>e", group = "edit" },
    { "<leader>f", group = "find" },
    { "<leader>d", group = "debug" },
    { "<leader>g", group = "git" },
    { "<leader>gf", group = "file" },
    { "<leader>t", group = "toggle" },
})

-- window navigation
vim.keymap.set("n", "<C-Down>", function() vim.cmd.wincmd("j") end, {})
vim.keymap.set("n", "<C-Up>", function() vim.cmd.wincmd("k") end, {})
vim.keymap.set("n", "<C-Left>", function() vim.cmd.wincmd("h") end, {})
vim.keymap.set("n", "<C-Right>", function() vim.cmd.wincmd("l") end, {})

-- edit
vim.keymap.set("n", "<leader>ef", vim.lsp.buf.format, { desc = "format" })

-- find / lsp
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "file" })
vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "grep" })
vim.keymap.set("n", "<leader>fh", telescope.oldfiles, { desc = "history" })
vim.keymap.set("n", "<leader>fd", telescope.lsp_definitions, { desc = "definition" })
vim.keymap.set("n", "<leader>fr", telescope.lsp_references, { desc = "references" })
vim.keymap.set("n", "<leader>fs", telescope.grep_string, { desc = "selection" })
vim.keymap.set("n", "<leader>fl", telescope.resume, { desc = "last search" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

-- file structure
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})

-- debug
local dap = require("dap")
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = "breakpoint" })
vim.keymap.set('n', '<leader>dc', dap.continue, { desc = "continue" })

-- git
local neogit = require("neogit")
vim.keymap.set('n', '<leader>gg', neogit.open, { desc = "git" })
vim.keymap.set('n', '<leader>gc', function() neogit.open { "commit" } end, { desc = "commit" })

local gitsigns = require("gitsigns")
vim.keymap.set('n', '<leader>gs', gitsigns.stage_hunk, { desc = "stage" })
vim.keymap.set('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = "unstage" })
vim.keymap.set('n', '<leader>gr', gitsigns.reset_hunk, { desc = "reset" })
vim.keymap.set('v', '<leader>gs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
    { desc = "stage" })
vim.keymap.set('v', '<leader>gs', function() gitsigns.undo_stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
    { desc = "unstage" })
vim.keymap.set('v', '<leader>gr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
    { desc = "reset" })
vim.keymap.set('n', '<leader>gfs', gitsigns.stage_buffer, { desc = "stage" })
--vim.keymap.set('n', '<leader>gfs', gitsigns.undo_stage_buffer, { desc = "unstage" })
vim.keymap.set('n', '<leader>gfr', gitsigns.reset_buffer, { desc = "reset" })
vim.keymap.set('n', '<leader>gd', gitsigns.preview_hunk, { desc = "diff line" })
vim.keymap.set('n', '<leader>gb', function() gitsigns.blame_line { full = true } end, { desc = "blame" })
vim.keymap.set('n', '<leader>gD', gitsigns.diffthis, { desc = "diff file" })
--vim.keymap.set('n', '<leader>gD', function() gitsigns.diffthis('~') end, {desc = "" })
--vim.keymap.set('n', '<leader>td', gitsigns.toggle_deleted, { desc = "deleted" })

-- toggle
vim.keymap.set('n', '<leader>tc', function() vim.cmd("Copilot toggle") end, { desc = "copilot" })
vim.keymap.set('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = "blame" })
