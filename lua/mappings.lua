local H = require('helpers')

vim.g.mapleader = " "

-- " Map escape
H.imap("jf", "<esc>")

-- " Base mappings
H.nmap('<leader>pw', ':Rg <C-R>=expand("<cword>")<CR><CR>')
H.nmap('<leader>phw', ':h <C-R>=expand("<cword>")<CR><CR>')
H.nmap('<leader>h', ':wincmd h<CR>')
H.nmap('<leader>j', ':wincmd j<CR>')
H.nmap('<leader>k', ':wincmd k<CR>')
H.nmap('<leader>l', ':wincmd l<CR>')
H.nmap('<leader>u', ':UndotreeShow<CR>')
H.nmap('<Leader>+', ':resize +5<CR>')
H.nmap('<Leader>-', ':resize -5<CR>')
H.nmap('<Leader>rp', ':resize 100<CR>')
H.nmap('<Leader><Leader>', ':e ~/.config/nvim/init.lua<CR>')
H.nmap('<Leader>rs', ':resize<space>')

-- " File navigation mappings
H.nmap('<Leader>fg', '<cmd>Telescope live_grep<cr>')
H.nmap('<Leader>ff', '<cmd>Telescope find_files<cr>')
H.nmap('<Leader>fb', '<cmd>Telescope buffers<cr>')
H.nmap('<Leader>fs', ':w<CR>')
H.nmap('<Leader>s', '<cmd>Telescope current_buffer_fuzzy_find<cr>')

-- scratchup (scratchpad doc)
H.nmap('<Leader>op', ':lua require("scratchup").open_popup()<cr>')
H.nmap('<Leader>cp', ':lua require("scratchup").close_popup()<cr>')

-- " CoC mappings
vim.cmd [[
inoremap <silent><expr> <C-space> coc#refresh()
nmap <silent> <leader>gd :call CocAction("jumpDefinition", "split")<CR>
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nmap <silent> <leader>ge <Plug>(coc-codeaction)
nnoremap <leader>cr :CocRestart<CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>pl :CocList project<CR>
nnoremap <leader>e :CocCommand explorer<CR>
]]

-- " Tabs
vim.cmd [[
function SplitResizeTerminal()
  exe "split | terminal"
  exe "resize 8"
endfunction
]]

H.nmap('<Leader>tn', ':tabnew<CR>')
H.nmap('<Leader>tnt', ':tabnew | terminal<CR>')
H.nmap('<Leader>tt', ':call SplitResizeTerminal()<CR>')
H.nmap('<silent><Leader>td', ':tabclose<CR>')

-- " Buffers mappings
H.nmap('<Leader><tab>', ':b#<CR>')
H.nmap('<Leader>bd', ':bd!<CR>')

-- " Fugitive / Git
H.nmap('<Leader>gp', ':Git push origin<space>')
H.nmap('<Leader>gl', ':Git pull origin<space>')
H.nmap('<Leader>gco', ':Git checkout<space>')
H.nmap('<Leader>gcm', ':Git checkout master<CR>')
H.nmap('<Leader>gs', ':Git<CR>')
