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

-- ToggleTerm keymaps
map.set({"n", "v", "i", "t"}, "<C-t>", ":ToggleTerm<cr>")

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  map.set('t', '<esc>', [[<C-\><C-n>]], opts)
  map.set('t', '<C-c>', [[<C-\><C-n>]], opts)
  map.set('t', 'jk', [[<C-\><C-n>]], opts)
  map.set('t', '<C-h>', [[:wincmd h<CR>]], opts)
  map.set('t', '<C-j>', [[:wincmd j<CR>]], opts)
  map.set('t', '<C-k>', [[:wincmd k<CR>]], opts)
  map.set('t', '<C-l>', [[:wincmd l<CR>]], opts)
  map.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')

map.set("n", "<leader>l", ":Lazy<CR>")
