-- options

--- compatibility
vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus"

--- visual
vim.opt.syntax = "on"
vim.opt.number = true
vim.opt.linebreak = true

--- tabs
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

--- searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- globals

--- python
vim.g.loaded_python_provider = 0
vim.g.python3_host_prog = "/usr/bin/python3"

--- mapping
vim.g.mapleader = " "

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
