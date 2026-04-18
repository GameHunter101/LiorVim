require("options")
-- require("lior.lazy")
require("remaps")
-- require("lior.lsp")

vim.loader.enable()

local augroup = vim.api.nvim_create_augroup
local lior_group = augroup("Lior", {})

local autocmd = vim.api.nvim_create_autocmd

vim.lsp.enable("luals")
