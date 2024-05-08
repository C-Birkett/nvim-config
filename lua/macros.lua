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

-- window navigation
vim.keymap.set("n", "<C-Down>", function() vim.cmd.wincmd("j") end, {})
vim.keymap.set("n", "<C-Up>", function() vim.cmd.wincmd("k") end, {})
vim.keymap.set("n", "<C-Left>", function() vim.cmd.wincmd("h") end, {})
vim.keymap.set("n", "<C-Right>", function() vim.cmd.wincmd("l") end, {})

-- edit
vim.keymap.set("n", "<leader>ef", vim.lsp.buf.format, {})

-- find
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})
--- lsp
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>fd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>fr", vim.lsp.buf.references, {})
--vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

-- file structure
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
--vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})

-- debug
local dap = require("dap")
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, {})
vim.keymap.set('n', '<leader>dc', dap.continue, {})

-- git
local neogit = require("neogit")
vim.keymap.set('n', '<leader>gg', neogit.open, {})
vim.keymap.set('n', '<leader>gc', function() neogit.open { "commit" } end)

local gitsigns = require("gitsigns")
vim.keymap.set('n', '<leader>gs', gitsigns.stage_hunk)
vim.keymap.set('n', '<leader>gr', gitsigns.reset_hunk)
vim.keymap.set('v', '<leader>gs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
vim.keymap.set('v', '<leader>gr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
vim.keymap.set('n', '<leader>gS', gitsigns.stage_buffer)
vim.keymap.set('n', '<leader>gu', gitsigns.undo_stage_hunk)
vim.keymap.set('n', '<leader>gR', gitsigns.reset_buffer)
vim.keymap.set('n', '<leader>gp', gitsigns.preview_hunk)
vim.keymap.set('n', '<leader>gb', function() gitsigns.blame_line { full = true } end)
vim.keymap.set('n', '<leader>gtb', gitsigns.toggle_current_line_blame)
vim.keymap.set('n', '<leader>gd', gitsigns.diffthis)
vim.keymap.set('n', '<leader>gD', function() gitsigns.diffthis('~') end)
vim.keymap.set('n', '<leader>gtd', gitsigns.toggle_deleted)
