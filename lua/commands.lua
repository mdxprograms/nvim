-- Only show cursorline in the current window and in normal mode.
vim.cmd [[
  augroup cline
      au!
      au WinLeave * set nocursorline
      au WinEnter * set cursorline
      au InsertEnter * set nocursorline
      au InsertLeave * set cursorline
  augroup END
]]

-- set theme
vim.cmd [[
  set colorcolumn=81
  highlight ColorColumn ctermbg=0 guibg=cyan
  silent! colorscheme dracula
  set background=dark
]]

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

-- ignore indentline on alpha startup
vim.cmd [[
 let g:indent_guides_exclude_filetypes = ['alpha']
]]
