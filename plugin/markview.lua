--[[ vim.pack.add({"https://github.com/OXY2DEV/markview.nvim"})

require("markview").setup({
    markdown = {
        enable = true,
    },
    latex = {
        enable = true,
    },
    typst = {
        enable = true,
        subscripts = {
            fake_preview = false,
        },
        superscripts = {
            fake_preview = false,
        },
        list_items = {
            shift_width = 1,
            indent_size = 2,
        }
    }
}) ]]
