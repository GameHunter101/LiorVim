vim.pack.add({
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/malewicz1337/oil-git.nvim" },
  { src = "https://github.com/JezerM/oil-lsp-diagnostics.nvim" },
})

require("oil-git").setup({
    show_ignored_files = true,
    show_ignored_directories = true,
    symbol_position = "signcolumn",
    symbols = {
        file = {added = "󰎔", modified = "", deleted = "󰆴", untracked = "󰛐", ignored = "󰛑"},
        directory = {added = "󰎔", modified = "", deleted = "󰆴", untracked = "󰛐", ignored = "󰛑"},
    }
})

require("oil").setup({
    columns = {
        "permission",
        "mtime"
    },
    keymaps = {
        ["<C-v>"] = { "actions.select", opts = { vertical = true } },
        ["<C-s>"] = { "actions.select", opts = { horizontal = true } },
        ["<C-e>"] = { "actions.close", mode = "n" },
    },
    skip_confirm_for_simple_edits = true,
    view_options = { show_hidden = true },
    win_options = { signcolumn = "auto:2" },
})

require("oil-lsp-diagnostics").setup()

vim.keymap.set("n", "<C-e>", "<cmd>Oil<cr>", { desc = "Oil" })
