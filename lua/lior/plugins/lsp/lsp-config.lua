return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            { "antosha417/nvim-lsp-file-operations", config = true },
        },
        config = function ()
            local lsp_zero = require("lsp-zero")
            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({buffer = bufnr})
                local opts = {buffer = bufnr, remap = false}
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                -- vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "ca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
            end)
            lsp_zero.setup_servers({'tsserver', 'rust_analyzer', "lua_ls"})
        end,
    },
    {
        'neovim/nvim-lspconfig',
    }
}
