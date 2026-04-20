local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Check if file changed outside of vim
autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
  group = augroup('checktime', { clear = true }),
  callback = function()
    if vim.bo.buftype ~= 'nofile' then
      vim.cmd('checktime')
    end
  end,
})

-- UI2 stuff
autocmd("FileType", {
	pattern = "msg",
	callback = function()
		local ui2 = require("vim._core.ui2")
		local win = ui2.wins and ui2.wins.msg
		if win and vim.api.nvim_win_is_valid(win) then
			vim.api.nvim_set_option_value(
				"winhighlight",
				"Normal:NormalFloat,FloatBorder:FloatBorder",
				{ scope = "local", win = win }
			)
		end
	end,
})

local ui2 = require("vim._core.ui2")
local msgs = require("vim._core.ui2.messages")
local orig_set_pos = msgs.set_pos
msgs.set_pos = function(tgt)
	orig_set_pos(tgt)
	if (tgt == "msg" or tgt == nil) and vim.api.nvim_win_is_valid(ui2.wins.msg) then
		pcall(vim.api.nvim_win_set_config, ui2.wins.msg, {
			relative = "editor",
			anchor = "NE",
			row = 1,
			col = vim.o.columns - 1,
			border = "rounded",
		})
	end
end

--[[ vim.api.nvim_create_autocmd("FileType", {
	pattern = "cmd",
	callback = function()
		vim.schedule(function()
			local win = ui2.wins and ui2.wins.cmd
			if win and vim.api.nvim_win_is_valid(win) then
				local win_config = vim.api.nvim_win_get_config(win)
				local width = math.floor(vim.o.columns / 2.0)
				local col = (vim.o.columns - width) / 2
				pcall(vim.api.nvim_win_set_config, win, {
					relative = "editor",
					row = vim.o.lines - 3,
					col = col,
					width = width,
					height = 1,
					-- anchor = "NW",
					border = --{"─", "─", "─", " ", " ", "", " ", " "},
                    "rounded",
                    style = "minimal"
				})
			end
		end)
	end,
}) ]]
