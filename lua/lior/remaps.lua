local map = vim.keymap

map.set("n", "<C-h>", "<C-w>h")
map.set("n", "<C-l>", "<C-w>l")
map.set("n", "<C-j>", "<C-w>j")
map.set("n", "<C-k>", "<C-w>k")
map.set("n", "<C-x>", "<C-w>q")

map.set("n", "<A-l>", ":BufferLineCycleNext<cr>")
map.set("n", "<A-h>", ":BufferLineCyclePrev<cr>")
map.set("n", "<C-w>", ":bd!<cr>")

-- Remaps from ThePrimeagen
map.set("v", "J", ":m '>+1<CR>gv=gv")
map.set("v", "K", ":m '<-2<CR>gv=gv")
map.set("n", "J", "mzJ`z")
map.set("n", "<C-d>", "<C-d>zz")
map.set("n", "<C-u>", "<C-u>zz")
map.set("n", "n", "nzzzv")
map.set("n", "N", "Nzzzv")
map.set("i", "<C-c>", "<Esc>")
map.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

map.set("n", "<leader>l", ":Lazy<CR>")
map.set("n", "<leader>h", ":Alpha<CR>")
map.set("n", "sh", ":split<Return><C-w>w")
map.set("n", "sv", ":vsplit<Return><C-w>w")
map.set("n", "<leader>xx", function() require("trouble").toggle() end)
map.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
map.set("n", "<leader>xf", function() require("trouble").toggle("document_diagnostics") end)

map.set("n", "<A-a>", ":vertical resize +5<CR>")
map.set("n", "<A-d>", ":vertical resize -5<CR>")

map.set("n", "<A-w>", ":resize +5<CR>")
map.set("n", "<A-s>", ":resize -5<CR>")
