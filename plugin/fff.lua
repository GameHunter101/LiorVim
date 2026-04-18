require("lazyload").on_vim_enter(function()
    vim.pack.add({"https://github.com/dmtrKovalenko/fff.nvim"})

    vim.api.nvim_create_autocmd("PackChanged", {
        callback = function()
            require("fff.download").download_or_build_binary()
        end
    })

    require("fff").setup({
        keymaps = {
            close = "<C-c>",
        },
        git = {
            status_text_color = true,
        },
        prompt = "󰱽 ",
    })

    vim.keymap.set("n", "<leader>fa", function () require("fff").find_files() end)
    vim.keymap.set("n", "<leader>fs", function () require("fff").live_grep() end)
    vim.keymap.set("n", "<leader>fu", ":FFFFind<CR> git:")
end)
