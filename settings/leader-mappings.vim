" Base mappings
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <Leader>pp :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader>fr :Buffers<CR>
nnoremap <Leader>fs :w<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader><Leader> :e ~/.config/nvim/init.vim<CR>
nnoremap <Leader>rs :resize<space>

" Tabs
"" terminal split bottom
function SplitResizeTerminal()
  exe "split | terminal"
  exe "resize 8"
endfunction

nnoremap <silent><Leader>tnt :tabnew<CR>
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
