" =============================================================================
" Filename: plugin/unite-auto_open.vim
" Author: itchyny
" License: MIT License
" Last Change: 2013/10/31 01:16:35.
" =============================================================================

if exists('g:loaded_unite_auto_open')
  finish
endif

let s:save_cpo = &cpo
set cpo&vim

let s:startfiletypes = '.*\.\(exe\|png\|gif\|jpg\|jpeg\|bmp\|eps\|tiff\|pdf\|mp3\|mp4\|avi\|mkv\)$'

let s:unite_auto_open = {
      \ 'description' : 'edit or open files',
      \ 'is_selectable' : 1,
      \ }

function! s:unite_auto_open.func(candidates)
  let startfiletypes = get(g:, 'auto_open_start', s:startfiletypes)
  try
    for candidate in a:candidates
      call unite#take_action(candidate.word =~? startfiletypes ? 'start' : 'open', candidate)
    endfor
  catch
  endtry
endfunction

if exists('*unite#custom_action')
  call unite#custom_action('file', 'auto_open', s:unite_auto_open)
endif

let g:unite_auto_open = s:unite_auto_open

let g:loaded_unite_auto_open = 1

let &cpo = s:save_cpo
unlet s:save_cpo
