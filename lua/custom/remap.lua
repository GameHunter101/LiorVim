vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "nzzzv")

vim.keymap.set("x", "p", '"_dP')

vim.keymap.set("n", "y", '"+y')
vim.keymap.set("v", "y", '"+y')

vim.keymap.set("n", "d", '"_d')
vim.keymap.set("v", "d", '"_d')

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>ww", ":bd!<CR>")

-- vim.keymap.set("n", "<C-j>", vim.cmd.bnext)
-- vim.keymap.set("n", "<C-f>", vim.cmd.bprev)
vim.api.nvim_set_keymap("n", "<C-Tab>", "<cmd>BufferLineCycleNext<cr>", {})
vim.api.nvim_set_keymap("n", "<C-S-Tab>", "<cmd>BufferLineCyclePrev<cr>", {})

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<C-s>", function()
	vim.cmd("w")
end)
vim.keymap.set("v", "<C-v>", '"+p')
vim.keymap.set("n", "<C-v>", '"+p')
vim.keymap.set("c", "<C-v>", '"+p')
vim.keymap.set("i", "<C-v>", '<ESC>l"+Pli')

vim.keymap.set({ "n", "v", "i" }, "<C-e>", ":Neotree toggle<cr>")

vim.keymap.set("n", "sh", ":split<Return><C-w>w")
vim.keymap.set("n", "sv", ":vsplit<Return><C-w>w")

vim.keymap.set("n", "<C-Space>", "<C-w>w")

vim.keymap.set("n", "<C-w><left>", "<C-w><")
vim.keymap.set("n", "<C-w><right>", "<C-w>>")
vim.keymap.set("n", "<C-w><up>", "<C-w>+")
vim.keymap.set("n", "<C-w><down>", "<C-w>-")

vim.keymap.set("n", "<leader>ps", "<cmd>:PackerSync<CR>")

vim.keymap.set("n", "<leader>h", "<cmd>:Alpha<CR>")

vim.keymap.set("i", "<C-Space>", "<nop>")

vim.keymap.set("n", "<leader>m", "<cmd>:Mason<CR>")
