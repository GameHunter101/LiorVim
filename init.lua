require("lior.options")
require("lior.lazy")
require("lior.remaps")
require("lior.lsp")

local augroup = vim.api.nvim_create_augroup
local lior_group = augroup("Lior", {})

local autocmd = vim.api.nvim_create_autocmd

vim.lsp.enable("luals")
