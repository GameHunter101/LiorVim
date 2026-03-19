return {
    "nvzone/floaterm",
    dependencies = "nvzone/volt",
    opts = {
        border = true,
        size = {h = 70, w = 80},
        mappings = {
            term = function (buf)
                vim.keymap.set({"n", "t"}, "<C-p>", function()
                    require("floaterm.api").cycle_term_bufs("prev")
                end, {buffer = buf})
                vim.keymap.set({"n", "t"}, "<C-n>", function()
                    require("floaterm.api").cycle_term_bufs("next")
                end, {buffer = buf})
            end
        }
    },
    keys = {
        { "<C-t>", function() require("floaterm").toggle() end, mode = {"n", "t"} },
        {"<C-a>", "<C-\\><C-n>", mode = "t"}
    }
}
