local status, rt = pcall(require, "rust-tools")
if not status then
    return
end

local mason_registry = require("mason-registry")

local codelldb = mason_registry.get_package("codelldb")
local extension_path = codelldb:get_install_path() .. "\\extension\\"
local codelldb_path = extension_path .. "adapter\\codelldb.exe"
local liblldb_path = extension_path .. "lldb\\lib\\liblldb.dll"

rt.setup({
    dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    },
    server = {
        capabilities = require("coq").lsp_ensure_capabilities(),
        on_attach = function(_, bufnr)
            vim.keymap.set("n", "<leader>k", rt.hover_actions.hover_actions, { buffer = bufnr })
            vim.keymap.set("n", "<leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
    tools = {
        hover_actions = {
            auto_focus = true,
        },
    },
})
