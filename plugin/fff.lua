vim.pack.add({"https://github.com/dmtrKovalenko/fff.nvim"})
vim.pack.add({"https://github.com/tiagovla/tokyodark.nvim"})

vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == 'fff.nvim' and (kind == 'install' or kind == 'update') then
            if not ev.data.active then
                vim.cmd.packadd('fff.nvim')
            end
            require('fff.download').download_or_build_binary()
        end
    end,
})

vim.g.fff = {
    lazy_sync = true,
    keymaps = {
        close = "<C-c>",
    },
    git = {
        status_text_color = true,
    },
    prompt = "󰱽 ",
}

vim.keymap.set("n", "<leader>fa", function () require("fff").find_files() end)
vim.keymap.set("n", "<leader>fs", function () require("fff").live_grep() end)
vim.keymap.set("n", "<leader>fu", ":FFFFind<CR> git:")
