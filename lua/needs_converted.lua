-- needs_converted

vim.cmd [[
  tnoremap <silent> jf <C-\><C-n>

  function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  if executable('rg')
    let g:rg_derive_root='true'
  endif

  fun! TrimWhitespace()
    if &ft =~ 'bash\|sh'
      return
    endif
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
  endfun

  if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

    au BufWritePre * :call TrimWhitespace()

    augroup highlight_yank
      autocmd!
      autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 50)
    augroup END

    au BufNewFile,BufRead *.gohtml set syntax=gohtmltmpl
  endif
]]