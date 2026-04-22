vim.pack.add({
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/malewicz1337/oil-git.nvim",
    "https://github.com/JezerM/oil-lsp-diagnostics.nvim",
})

require("oil-git").setup({
    show_ignored_files = true,
    show_ignored_directories = true,
    symbol_position = "signcolumn",
    symbols = {
        file = { added = "󰎔", modified = "", deleted = "󰆴", untracked = "󰛐", ignored = "󰛑" },
        directory = { added = "󰎔", modified = "", deleted = "󰆴", untracked = "󰛐", ignored = "󰛑" },
    }
})

require("oil").setup({
    keymaps = {
        ["<C-v>"] = { "actions.select", opts = { vertical = true } },
        ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
        ["<C-e>"] = { "actions.close", mode = "n" },
    },
    skip_confirm_for_simple_edits = true,
    view_options = { show_hidden = true },
    win_options = { signcolumn = "auto:2" },
    float = {
        max_width = 0.8,
        max_height = 0.8,
    }
})

require("oil-lsp-diagnostics").setup()

vim.keymap.set("n", "<C-e>", function() require("oil").open_float(".") end)
