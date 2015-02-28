" breakit.vim - Break lines
" Author:       Patrick Haun
" Version:      0.1

if exists("g:loaded_breakit") || &cp || v:version < 700
  finish
endif
let g:loaded_breakit = 1

function! s:getchar()
  let c = getchar()
  if c =~ '^\d\+$'
    let c = nr2char(c)
  endif
  return c
endfunction

function! s:BreakAfter()
  let l:breakchar = s:getchar()
  execute 'substitute/\V\(' . l:breakchar . '\)/\1\r/g'
endfunction

function! s:BreakBefore()
  let l:breakchar = s:getchar()
  execute 'substitute/\V\(' . l:breakchar . '\)/\r\1/g'
endfunction



nnoremap <silent> <Plug>Bafter :<C-U>call <SID>BreakAfter()<CR>
nnoremap <silent> <Plug>Bbefore :<C-U>call <SID>BreakBefore()<CR>

if !exists("g:breakit_no_mappings") || ! g:breakit_no_mappings
  nmap <Leader>ba <Plug>Bafter
  nmap <Leader>bb <Plug>Bbefore
end
