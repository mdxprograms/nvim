local H = require('helpers')

-- take me to your leader
vim.g.mapleader = " "

-- Map escape
H.imap("jf", "<esc>")


-----------------
-- Normal mode --
-----------------

-- Better window navigation
H.nmap('<Leader>h', ':wincmd h<CR>')
H.nmap('<Leader>j', ':wincmd j<CR>')
H.nmap('<Leader>k', ':wincmd k<CR>')
H.nmap('<Leader>l', ':wincmd l<CR>')

-- Resize with arrows
-- delta: 2 lines
H.nmap('<C-Up>', ':resize -2<CR>')
H.nmap('<C-Down>', ':resize +2<CR>')
H.nmap('<C-Left>', ':vertical resize -2<CR>')
H.nmap('<C-Right>', ':vertical resize +2<CR>')

-- Buffers mappings
H.nmap('<Leader><tab>', ':b#<CR>')
H.nmap('<Leader>bd', ':bd!<CR>')

-- Save buffer
H.nmap('<Leader>fs', ':w<CR>')

-- Open init.lua
H.nmap('<Leader><Leader>', ':e ~/.config/nvim/init.lua<CR>')
