local map = vim.keymap

map.set("n", "<C-h>", "<C-w>h")
map.set("n", "<C-l>", "<C-w>l")
map.set("n", "<C-j>", "<C-w>j")
map.set("n", "<C-k>", "<C-w>k")
map.set("n", "<C-x>", "<C-w>q")

map.set("n", "<S-q>", ":bd!<cr>")

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

map.set("n", "<leader>sh", ":split<Return><C-w>w")
map.set("n", "<leader>sv", ":vsplit<Return><C-w>w")

map.set("n", "<A-a>", ":vertical resize +5<CR>")
map.set("n", "<A-d>", ":vertical resize -5<CR>")

map.set("n", "<A-w>", ":resize +5<CR>")
map.set("n", "<A-s>", ":resize -5<CR>")
map.set("n", "<leader><Esc>", "<cmd>restart<CR>")
map.set("n", "<leader>h", "<cmd>noh<CR>")
map.set("t", "<C-a>", "<C-\\><C-n>")
map.set("n", "<a-j>", "<cmd>try | cnext | catch | cfirst | catch | endtry<CR>")
map.set("n", "<a-k>", "<cmd>try | cprev | catch | clast | catch | endtry<CR>")
map.set({"n", "v"}, "<a-y>", '"+y')
map.set({"n", "v"}, "<a-p>", '"+p')

vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.keymap.set("n", "<CR>", "<CR>", { buffer = true, remap = true })
  end,
})

map.set("n", "<leader>u", require("undotree").open)
