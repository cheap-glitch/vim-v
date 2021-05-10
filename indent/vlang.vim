if exists("b:current_indent")
	finish
endif
let b:current_indent="vlang"

setlocal autoindent smartindent
setlocal indentkeys+=0=},0=) indentexpr=VIndentExpr(v:lnum)

function! VIndentExpr(lnum) abort

	" Get the number of the previous line
	let prev_lnum = prevnonblank(a:line - 1)
	if prev_lnum == 0
		return 0
	endif

	" Get the content of the current and previous lines (remove end-of-line comments)
	let prev_line = substitute(getline(prev_lnum), '//.*$', '', '')
	let line      = substitute(getline(lnum),      '//.*$', '', '')

	" Get the indent of the previous line
	let prev_indent = indent(prev_lnum)

	" If the previous line opened a block
	if prev_line =~ '[({]\s*$'
		return prev_indent + shiftwidth()
	endif

	" If the previous line closed a block
	if prev_line =~ '^\s*[)}]'
		return prev_indent - shiftwidth()
	endif

endfunction
