vim.pack.add({"https://github.com/folke/snacks.nvim"})

require("snacks").setup({
    input = {
        enabled = true
    },
    indent = {
        enabled = true
    },
    quickfile = {
        enabled = true
    },
    image = {
        enabled = true
    },
    picker = {
        enabled = true,
    }
})

vim.keymap.set("n", "<leader>fa", Snacks.picker.files)
vim.keymap.set("n", "<leader>fg", Snacks.picker.git_files)
vim.keymap.set("n", "<leader>fs", Snacks.picker.grep)
vim.keymap.set("n", "<leader>fp", Snacks.picker.projects)
vim.keymap.set("n", "<a-3>", Snacks.picker.grep_word)
