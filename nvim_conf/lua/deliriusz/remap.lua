-- I don't have anything mapped per file type, soe localleader is the same as leader
vim.g.mapleader = ","
vim.g.maplocalleader=","

-- make c-n and c-p filter for what you've already typed
vim.keymap.set("c", "<C-p>",  "<Up>")
vim.keymap.set("c", "<C-n>", "<Down>")

vim.keymap.set("i", "jk", "<Esc><cmd>w<CR>")

vim.keymap.set("n", "<leader>r", "<cmd>source $MYVIMRC<CR>")

vim.keymap.set("n", "<C-s>", "<cmd>w<CR>")
vim.keymap.set("i", "<C-s>", "<C-o><cmd>w<CR>")
vim.keymap.set("i", "<C-f><C-f>", "<C-x><C-f>")

vim.keymap.set("n", "<leader>b", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>t", ":Tabularize /")
vim.keymap.set("v", "<leader>t", ":Tabularize /")

vim.keymap.set("n", "<C-J>", "<C-W>J") -- Ctrl-j to move down a split
vim.keymap.set("n", "<C-K>", "<C-W>K") -- Ctrl-k to move up a split
vim.keymap.set("n", "<C-L>", "<C-W>L") -- Ctrl-l to move	right a split
vim.keymap.set("n", "<C-H>", "<C-W>H") -- Ctrl-h to move left a split
vim.keymap.set("n", "<C-j>", "<C-W><C-j>") -- Ctrl-j to move down a split
vim.keymap.set("n", "<C-k>", "<C-W><C-k>") -- Ctrl-k to move up a split
vim.keymap.set("n", "<C-l>", "<C-W><C-l>") -- Ctrl-l to move	right a split
vim.keymap.set("n", "<C-h>", "<C-W><C-h>") -- Ctrl-h to move left a split
vim.keymap.set("n", "<leader>h", "<cmd>nohls<CR>")

-- center screen after jumping half page
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- in block visual selection move selected lines up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- quickly go between tabs
-- vim.keymap.set("n", "11", "1gt")
-- vim.keymap.set("n", "22", "2gt")
-- vim.keymap.set("n", "33", "3gt")
-- vim.keymap.set("n", "44", "4gt")
-- vim.keymap.set("n", "55", "5gt")
-- vim.keymap.set("n", "66", "6gt")
-- vim.keymap.set("n", "77", "7gt")
-- vim.keymap.set("n", "88", "8gt")
-- vim.keymap.set("n", "99", "9gt")

vim.keymap.set("n", "<leader>ss", "<cmd>split<CR>")
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>")

-- copy visually seleted lines with line numbers to + buffer
vim.keymap.set("v", "<f4>", ":<home>redir @+<bar>silent! <end>number<bar>redir END<CR>")
vim.keymap.set("n", "<f3>", ':let @+ = expand("%")<CR>')
-- toggle invisible chars
-- vim.keymap.set('n', '<leader>l', function() vim.o.list = not vim.o.list end)

-- write console.log for word under cursor
-- TODO: detect language and write proper logging command per language
vim.keymap.set("n", "<leader>l", '"ayiwoconsole.log(\'<C-R>a:\', <C-R>a);<Esc>')
-- write console.log for highlighted data
vim.keymap.set("x", "<leader>l", '"ayoconsole.log(\'<C-R>a:\', <C-R>a);<Esc>')

-- unmap change whole file. I constantly press it when calling 'ciw'
vim.keymap.set("n", "cie", '<Nop>')

-- Neovim Lua mappings to use the black hole register for delete/change
-- Normal mode mappings
vim.keymap.set("n", "_d", '"_d', { noremap = true })
vim.keymap.set("n", "_dd", '"+dd', { noremap = true })
vim.keymap.set("n", "_D", '"_D', { noremap = true })
vim.keymap.set("n", "_x", '"_x', { noremap = true })
vim.keymap.set("n", "_c", '"_c', { noremap = true })
vim.keymap.set("n", "_cc", '"_cc', { noremap = true })
vim.keymap.set("n", "_C", '"_C', { noremap = true })
vim.keymap.set("n", "_s", '"_s', { noremap = true })
vim.keymap.set("n", "_S", '"_S', { noremap = true })

-- Visual mode mappings
vim.keymap.set("v", "_d", '"_d', { noremap = true })
vim.keymap.set("v", "_c", '"_c', { noremap = true })
vim.keymap.set("v", "_y", '"_y', { noremap = true })
-- vim.keymap.set("v", "y", '"+y', { noremap = true })
