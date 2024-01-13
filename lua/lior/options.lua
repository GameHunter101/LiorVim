local g = vim.g
local opt = vim.opt
local o = vim.o

g.mapleader = " "
g.maplocalleader = " "

opt.smartindent = true
opt.autoindent = true
opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.ignorecase = true
opt.smartcase = true
opt.wrap = false
opt.hlsearch = false

opt.termguicolors = true
opt.signcolumn = "yes"
opt.updatetime = 50
opt.fillchars = {
    eob = " ",
}
opt.cursorline = true
o.background = "dark"
opt.scrolloff = 10
