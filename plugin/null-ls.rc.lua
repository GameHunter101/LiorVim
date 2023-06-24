---@diagnostic disable: redundant-parameter
local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.completion.spell,
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.rustywind,
	},
	diagnostics_format = "[#{s} | #{c}] #{m}",
})
