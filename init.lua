-- options

vim.opt.compatible = false
vim.opt.filetype = "off"
vim.opt.syntax = "on"
vim.opt.clipboard = "unnamedplus"
vim.opt.showmode = false
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- globals

vim.g.loaded_python_provider = 0
vim.g.python3_host_prog = "/usr/bin/python3"

--require("macros")

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

local plugins = {
    -- folder management
    {'preservim/nerdtree'},
    {'vimwiki/vimwiki'},

    -- graphical
    {'mhinz/vim-startify'}
}

require("lazy").setup("plugins")
