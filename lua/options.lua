-- keybinds
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.relativenumber = true
vim.o.number = true

-- incremental search
vim.o.hlsearch = true
vim.o.incsearch = true

-- indent settings
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.autochdir = true
vim.g.netrw_keepdir = 0
vim.o.showmode = false -- not needed, have lualine for this

vim.o.smartindent = true
vim.o.autoindent = true

vim.o.termguicolors = true
vim.o.scrolloff = 8
vim.o.updatetime = 50
vim.o.wrap = false
vim.o.breakindent = true
vim.o.cursorline = true
vim.o.guicursor = "v-i-n-c:block,a:blinkwait700-blinkoff400-blinkon250" -- TODO: change color based on mode

-- remaps (thanks ThePrimeAgen)
vim.keymap.set("i", "kj", "<Esc>")
vim.keymap.set("n", "<leader>pv", ":Ex<CR>")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzz") -- page centering
vim.keymap.set("n", "N", "Nzz") -- page centering
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
