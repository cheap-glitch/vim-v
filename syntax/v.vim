
"
" vim-v/syntax
"
" Quality syntax highlighting for the V programming language.
"
" Copyright (c) 2019-present, cheap glitch
"
" Permission to use, copy, modify, and/or distribute this software for any purpose
" with or without fee is hereby  granted, provided that the above copyright notice
" and this permission notice appear in all copies.
"
" THE SOFTWARE  IS PROVIDED 'AS IS'  AND THE AUTHOR DISCLAIMS  ALL WARRANTIES WITH
" REGARD TO THIS SOFTWARE INCLUDING  ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
" FITNESS.  IN NO  EVENT  SHALL THE  AUTHOR  BE LIABLE  FOR  ANY SPECIAL,  DIRECT,
" INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS
" OF USE, DATA OR  PROFITS, WHETHER IN AN ACTION OF  CONTRACT, NEGLIGENCE OR OTHER
" TORTIOUS ACTION, ARISING OUT OF OR IN  CONNECTION WITH THE USE OR PERFORMANCE OF
" THIS SOFTWARE.
"

if exists("b:current_syntax")
	finish
endif
let b:current_syntax="v"

" ==============================================================================
" Operators
" ==============================================================================

syn match vOperator /\v[=!<>:*/+-]?\=/
syn match vOperator /\V+/
syn match vOperator /\V-/
syn match vOperator /\V*/
syn match vOperator "\V/"
syn match vOperator /\V>/
syn match vOperator /\V</
syn match vOperator /\V++/
syn match vOperator /\V--/

hi link vOperator Operator

" ==============================================================================
" Types
" ==============================================================================

syn keyword vTypes     bool byte byteptr rune string voidptr
syn keyword vInts      int i8 u8 i16 u16 i32 u32 i64 u64
syn keyword vFloats    f32 f64
syn keyword vStructure enum struct

hi link vType      Type
hi link vInts      Type
hi link vFloats    Type
hi link vStructure Structure

" ==============================================================================
" Constants
" ==============================================================================

syn keyword vBoolean true false
syn match vNumber /\v\d+(\.(\d+)?)?/
syn match vCharacter /\v`.`/

hi link vNumber    Number
hi link vBoolean   Boolean
hi link vCharacter Character

" ==============================================================================
" Strings
" ==============================================================================

syn region vString start=/\vr?'/ end=/\v'/ skip=/\v(\\)@<!\\'/
syn region vString start=/\vr?"/ end=/\v"/ skip=/\v(\\)@<!\\"/

" String interpolations
syn match vSimpleInterpolation contained containedin=vString /\v(\\)@<!\$\w+/
syn region vInterpolation      contained containedin=vString matchgroup=vSimpleInterpolation start=/\v(\\)@<!\$\{/ end=/\V}/

hi link vString              String
hi link vSimpleInterpolation Special

" ==============================================================================
" Keywords
" ==============================================================================

syn keyword vKeyword break
syn keyword vKeyword const
syn keyword vKeyword continue
syn keyword vKeyword fn
syn keyword vKeyword import
syn keyword vKeyword len
syn keyword vKeyword map
syn keyword vKeyword module
syn keyword vKeyword mut
syn keyword vKeyword return

syn keyword vConditional else
syn keyword vConditional if
syn keyword vConditional or
syn keyword vConditional switch

syn keyword vRepeat for
syn keyword vRepeat in

syn keyword vLabel case
syn keyword vLabel default

syn keyword vSpecial pub

" Pre-compilaton conditionals
syn region  vPreCond   start=/\V$if/ end=/\v$/ transparent
syn match   vPreCondIf /\V$if/           contained containedin=vPreCond
syn keyword vOS        linux mac windows contained containedin=vPreCond
syn keyword vDebug     debug             contained containedin=vPreCond

hi link vKeyword      Keyword
hi link vConditional  Conditional
hi link vRepeat       Repeat
hi link vLabel        Label
hi link vSpecial      Special
hi link vPreCondIf    PreCondit
hi link vOS           PreCondit
hi link vDebug        Debug

" ==============================================================================
" Functions
" ==============================================================================

" Built-in
syn keyword vBuiltInFunction eprint
syn keyword vBuiltInFunction eprintln
syn keyword vBuiltInFunction print
syn keyword vBuiltInFunction println
syn keyword vBuiltInFunction repeat

" User-defined
syn match vFunctionDeclaration /\v(fn )@<=\w+/

hi link vBuiltInFunction     Function
hi link vFunctionDeclaration Title

" ==============================================================================
" Modules
" ==============================================================================

" Built-in
syn keyword vBuiltInModule math
syn keyword vBuiltInModule os

" User-defined
syn match vModuleName /\v((import )@<=|(module )@<=).+/

hi link vBuiltInModule Function
hi link vModuleName    Identifier

" ==============================================================================
" Comments
" ==============================================================================

syn match  vComment          "\v//.*"
syn region vMultiLineComment start="\v/\*" end="\v\*/" skip=/\v'|"/

syn keyword vTodo TODO FIXME contained containedin=vComment,vMultiLineComment

hi link vComment          Comment
hi link vMultiLineComment Comment
hi link vTodo             Todo

" ==============================================================================
" Folding
" ==============================================================================

syn region vFold start="{" end="}" transparent fold

"@TODO: add more constructs

" ==============================================================================
" Warnings
" ==============================================================================

" Highlight lines containing statements ending with semicolons
syn match vWarning /\v.*;(\s*}|$)/

" Highlight conditions surrounded by parentheses
syn match vWarning /\v(if)@<=[^{]*[()]/

hi link vWarning Error
