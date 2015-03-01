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

function! s:BreakAfterChar()
  let l:breakchar = s:getchar()
  call s:BreakAfter(l:breakchar, "")
endfunction

function! s:BreakBeforeChar()
  let l:breakchar = s:getchar()
  call s:BreakBefore(l:breakchar)
endfunction

function! s:BreakAfterCharRemoveSpace()
  let l:breakchar = s:getchar()
  let l:breakString = l:breakchar
  call s:BreakAfter(l:breakchar, " ")
endfunction

function! s:BreakAfter(breakString, additionalMatch)
  execute 'substitute/\V\(' . a:breakString . '\)' . a:additionalMatch . '/\1\r/g'
endfunction

function! s:BreakBefore(breakString)
  execute 'substitute/\V\(' . a:breakString . '\)/\r\1/g'
endfunction

nnoremap <silent> <Plug>Bafter :<C-U>call <SID>BreakAfterChar()<CR>
nnoremap <silent> <Plug>Bafter_remove_space :<C-U>call <SID>BreakAfterCharRemoveSpace()<CR>
nnoremap <silent> <Plug>Bbefore :<C-U>call <SID>BreakBeforeChar()<CR>

if !exists("g:breakit_no_mappings") || ! g:breakit_no_mappings
  nmap <Leader>ba <Plug>Bafter
  nmap <Leader>bA <Plug>Bafter_remove_space
  nmap <Leader>bb <Plug>Bbefore
end
