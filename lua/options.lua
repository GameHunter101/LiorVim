local g = vim.g
local opt = vim.opt

g.mapleader = " "
g.maplocalleader = " "

opt.smartindent = true
opt.autoindent = true
opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.ignorecase = true
opt.smartcase = true
opt.wrap = false
opt.hlsearch = true

opt.termguicolors = true
opt.signcolumn = "yes"
opt.updatetime = 50
opt.fillchars = {
    eob = " ",
}
opt.cursorline = true
opt.background = "dark"
opt.scrolloff = 10
opt.autocomplete = false
opt.completeopt = "menu,menuone,noselect,popup"
opt.splitbelow = true
opt.splitright = true
opt.winborder = "rounded"

if vim.fn.has("termguicolors") then
  vim.opt.termguicolors = true
end

opt.cmdheight = 0
opt.laststatus = 2

opt.matchpairs:append({"<:>", "$:$"})

require("vim._core.ui2").enable({
    enable = true,
    msg = {
		targets = {
			[""] = "msg",
			empty = "msg",
			bufwrite = "msg",
			confirm = "msg",
			emsg = "msg",
			echo = "msg",
			echomsg = "msg",
			echoerr = "msg",
			completion = "msg",
			list_cmd = "msg",
			lua_error = "msg",
			lua_print = "msg",
			progress = "pager",
			rpc_error = "msg",
			quickfix = "msg",
			search_cmd = "pager",
			search_count = "pager",
			shell_cmd = "msg",
			shell_err = "msg",
			shell_out = "msg",
			shell_ret = "msg",
			undo = "msg",
			verbose = "msg",
			wildlist = "msg",
			wmsg = "msg",
			typed_cmd = "msg",
		},
		cmd = {
			height = 0.5,
		},
		dialog = {
			height = 0.5,
		},
		msg = {
			height = 0.3,
			timeout = 4000,
		},
		pager = {
			height = 0.5,
		},
	},
})
