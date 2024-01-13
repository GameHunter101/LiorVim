require("lior.options")
require("lior.lazy")
require("lior.remaps")

local augroup = vim.api.nvim_create_augroup
local lior_group = augroup("Lior", {})

local autocmd = vim.api.nvim_create_autocmd

autocmd("LspAttach", {
    group = lior_group,
    callback = function(e)
        local opts = { buffer = e.buf }

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "ca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "do", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>")
    end
})
