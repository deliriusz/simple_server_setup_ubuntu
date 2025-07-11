local api = vim.api

-- disable netrw at the very start of your init.lua
-- required for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.autoindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ts = 3
vim.opt.sts = 3
vim.opt.sw = 3

vim.opt.expandtab = true
vim.opt.wrap = true

-- vim.opt.backspace = 2

vim.opt.timeoutlen = 500

vim.opt.rtp:append { '/usr/local/opt/fzf' } --adding fzf to vim

vim.opt.encoding = "utf-8"
vim.opt.enc = "utf-8"
vim.opt.fenc = "utf-8"
-- vim.opt.tenc = "utf-8"

vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.list = true
--vim.opt.listchars = { space = '_', tab = '>-' }
vim.opt.listchars = { tab = '>-' }
vim.opt.history = 200

vim.opt.cursorline = true

vim.opt.backup = true
vim.opt.backupdir = "/tmp"
vim.opt.dir = "/tmp"

-- I had to switch, and remap y to "*y and p, because dd, and visual substutition drove me nuts
vim.opt.clipboard = 'unnamedplus'
-- vim.opt.clipboard = ""

-- set auto-folds when opening files
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 5
vim.opt.foldlevelstart = 5
vim.opt.foldnestmax = 8

--  buffer switch - allow wildcards bar and case insensitive search there
-- vim.opt.wildmenu
-- vim.opt.wildmode=longest,list,full
-- vim.opt.wildignore+=*/tmp/*,*.so,*.swp,.git/*,node_modules  " MacOSX/Linux
-- vim.opt.wildignorecase

vim.opt.termguicolors = true

-- comment style config
api.nvim_create_autocmd("FileType", { pattern = "solidity", command = [[setlocal commentstring=//\ %s]] })
api.nvim_create_autocmd("FileType", { pattern = "yul", command = [[setlocal commentstring=//\ %s]] })

-- vim session options
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
