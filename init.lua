-- options & globals

--- compatibility
vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus"

--- visual
vim.opt.syntax = "on"
vim.opt.number = true
vim.opt.linebreak = true
vim.g.nord_italic = false
vim.opt.cmdheight = 0

--- tabs
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

--- searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

--- python
vim.g.loaded_python_provider = 0

--- mapping
vim.g.mapleader = " "

-- machine specific defs
require("machine_local")

-- lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- personal bindings
require("macros")
