vim.g.mapleader = " "

-- " Map escape
imap("jf", "<esc>")

-- " Base mappings
nmap('<leader>pw', ':Rg <C-R>=expand("<cword>")<CR><CR>')
nmap('<leader>phw', ':h <C-R>=expand("<cword>")<CR><CR>')
nmap('<leader>h', ':wincmd h<CR>')
nmap('<leader>j', ':wincmd j<CR>')
nmap('<leader>k', ':wincmd k<CR>')
nmap('<leader>l', ':wincmd l<CR>')
nmap('<leader>u', ':UndotreeShow<CR>')
nmap('<Leader>+', ':resize +5<CR>')
nmap('<Leader>-', ':resize -5<CR>')
nmap('<Leader>rp', ':resize 100<CR>')
nmap('<Leader><Leader>', ':e ~/.config/nvim/init.lua<CR>')
nmap('<Leader>rs', ':resize<space>')

-- " File navigation mappings
nmap('<Leader>fg', '<cmd>Telescope live_grep<cr>')
nmap('<Leader>ff', '<cmd>Telescope find_files<cr>')
nmap('<Leader>fb', '<cmd>Telescope buffers<cr>')
nmap('<Leader>fs', ':w<CR>')
nmap('<Leader>s', '<cmd>Telescope current_buffer_fuzzy_find<cr>')

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

nmap('<Leader>tn', ':tabnew<CR>')
nmap('<Leader>tnt', ':tabnew | terminal<CR>')
nmap('<Leader>tt', ':call SplitResizeTerminal()<CR>')
nmap('<silent><Leader>td', ':tabclose<CR>')

-- " Buffers mappings
nmap('<Leader><tab>', ':b#<CR>')
nmap('<Leader>bd', ':bd!<CR>')

-- " Fugitive / Git
nmap('<Leader>gp', ':Git push origin<space>')
nmap('<Leader>gl', ':Git pull origin<space>')
nmap('<Leader>gco', ':Git checkout<space>')
nmap('<Leader>gcm', ':Git checkout master<CR>')
nmap('<Leader>gs', ':Git<CR>')
