" Base mappings
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <Leader>+ :resize +5<CR>
nnoremap <Leader>- :resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader><Leader> :e ~/.config/nvim/init.vim<CR>
nnoremap <Leader>rs :resize<space>

" File navigation mappings
nnoremap <Leader>fg <cmd>Telescope live_grep<cr>
nnoremap <Leader>ff <cmd>Telescope find_files<cr>
nnoremap <Leader>fb <cmd>Telescope buffers<cr>
nnoremap <Leader>fs :w<CR>
nnoremap <Leader>s /

" CoC mappings
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

" coc-explorer
nnoremap <leader>e :CocCommand explorer<CR>

" Tabs
"" terminal split bottom
function SplitResizeTerminal()
  exe "split | terminal"
  exe "resize 8"
endfunction

function NewTabTerminal()
  exe "tabnew | terminal"
endfunction

" Tabs
nnoremap <silent><Leader>tn :tabnew<CR>
nnoremap <silent><Leader>tnt :call NewTabTerminal()<CR>
nnoremap <silent><Leader>tt :call SplitResizeTerminal()<CR>
nnoremap <silent><Leader>td :tabclose<CR>

" Buffers mappings
nnoremap <Leader><tab> :b#<CR>
nnoremap <Leader>bd :bd!<CR>

" Fugitive / Git
nmap <Leader>gp :Git push origin<space>
nmap <Leader>gl :Git pull origin<space>
nmap <Leader>gco :Git checkout<space>
nmap <Leader>gcm :Git checkout master<CR>
nmap <Leader>gs :Git<CR>

" Merginal
nmap <Leader>gm :MerginalToggle<CR>
