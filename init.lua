-- options & globals

--- compatibility
vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus"

--- visual
vim.opt.syntax = "on"
vim.opt.number = true
vim.opt.linebreak = true
vim.g.nord_italic = false
vim.g.nord_uniform_diff_background = true
vim.opt.cmdheight = 1

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

-- default configs
USE_COPILOT = false

-- platform specific overrides
if vim.loop.os_uname().sysname == "Windows_NT" then
    require("/platform/windows")
elseif vim.loop.os_uname().sysname == "Linux" then -- TODO get correct string
    require("/platform/linux")
end

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
