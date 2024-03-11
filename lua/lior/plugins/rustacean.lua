return {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
    config = function ()
        -- vim.g.rustaceanvim = {}
        vim.keymap.set('n', '<F5>', ":RustLsp debuggables<CR>")
    end
}
