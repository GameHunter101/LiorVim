return {
    "echasnovski/mini.indentscope",
    opts = {
        symbol = "▏",
    },
    init = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "help",
                "alpha",
                "dashboard",
                "neo-tree",
                "lazy",
                "mason",
                "toggleterm",
            },
            callback = function ()
                vim.b.miniindentscope_disable = true
            end,
        })
    end,
}
