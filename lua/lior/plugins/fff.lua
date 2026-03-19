return {
    "dmtrKovalenko/fff.nvim",
    build = function ()
        require("fff.download").download_or_build_binary()
    end,
    lazy = false,
    opts = {
        keymaps = {
            close = "<C-c>",
        },
        git = {
            status_text_color = true,
        },
        prompt = "󰱽 ",
    },
    keys = {
        {
            "<leader>fa",
            function () require("fff").find_files() end,
            desc = "FFF browse files"
        },
        {
            "<leader>fs",
            function () require("fff").live_grep() end,
            desc = "FFF live grep"
        },
    },
}
