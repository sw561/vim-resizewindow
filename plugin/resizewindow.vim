if exists('g:loaded_resizewindow')
	finish
endif
let g:loaded_resizewindow = 1

nnoremap <silent> <Plug>ResizeWindowRight :<C-U>call <SID>ResizeWindow(v:count1, '>')<CR>
nnoremap <silent> <Plug>ResizeWindowLeft  :<C-U>call <SID>ResizeWindow(v:count1, '<')<CR>
nnoremap <silent> <Plug>ResizeWindowUp    :<C-U>call <SID>ResizeWindow(v:count1, '-')<CR>
nnoremap <silent> <Plug>ResizeWindowDown  :<C-U>call <SID>ResizeWindow(v:count1, '+')<CR>

augroup CmdwinResize " {{{
	au!
	autocmd CmdwinEnter * nnoremap <buffer> <Plug>ResizeWindowRight <nop>
	autocmd CmdwinEnter * nnoremap <buffer> <Plug>ResizeWindowLeft <nop>
	autocmd CmdwinEnter * nnoremap <buffer> <Plug>ResizeWindowDown <C-W>-
	autocmd CmdwinEnter * nnoremap <buffer> <Plug>ResizeWindowUp <C-W>+
augroup END " }}}

function! <SID>ResizeWindow(times, direction) abort " {{{
	if winnr('$') == 1
		return
	endif
	let l:direction = a:direction
	let l:movement = { '<' : 'l', '-' : 'j', '+' : 'j', '>' : 'l' }
	let l:opposite = { '<' : '>', '-' : '+', '+' : '-', '>' : '<' }
	let l:winnr = winnr()
	execute 'wincmd' l:movement[l:direction]
	if winnr() == l:winnr
		let l:direction = l:opposite[l:direction]
	else
		execute l:winnr . 'wincmd' 'w'
	endif
	execute a:times 'wincmd' l:direction
endfunction " }}}

" vim:fdm=marker
