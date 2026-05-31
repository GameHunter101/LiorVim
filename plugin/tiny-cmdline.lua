vim.pack.add({{
    src = "https://github.com/rachartier/tiny-cmdline.nvim",
}})
vim.o.cmdheight = 0
require("tiny-cmdline").setup({
    on_reposition = require("tiny-cmdline").adapters.blink,
    native_types = {},
})
