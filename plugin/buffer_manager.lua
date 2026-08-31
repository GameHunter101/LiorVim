require("lazyload").on_vim_enter(function()
    vim.pack.add({
        { src = "https://github.com/nvim-lua/plenary.nvim" },
        { src = "https://github.com/j-morano/buffer_manager.nvim" }
    })

    require("buffer_manager") .setup({
        short_file_names = true,
        short_term_names = true,
        loop_nav = true,
        select_menu_item_commands = {
            v = {
                key = "<C-v>",
                command = "vsplit"
            },
            h = {
                key = "<C-h>",
                command = "split"
            }
        },
    })

    vim.keymap.set("n", "<leader>t", require("buffer_manager.ui").toggle_quick_menu)
end)
--[[ vim.pack.add({ "https://github.com/ahkohd/buffer-sticks.nvim" })
require("buffer-sticks").setup({
    auto_hide = false,
    list = {
        keys = {
            close_buffer = "D",
            move_up = "<C-p>",
            move_down = "<C-n>",
        },
        filter = {
            keys = {
                exit = "?",
                move_up = "<C-p>",
                move_down = "<C-n>",
            }
        }
    }
})

vim.keymap.set("n", "<leader>t", function () BufferSticks.list({action = "open"}) end)
vim.keymap.set("n", "<C-c>", BufferSticks.hide) ]]
