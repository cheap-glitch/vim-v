
"
" vim-v/syntax
"
" Quality syntax highlighting for the V programming language.
"
" Copyright (c) 2019-present, cheap glitch
"
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
" {{{

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

" }}}
" ==============================================================================
" Types
" ==============================================================================
" {{{

syn keyword vType      bool byte byteptr rune string voidptr
syn keyword vInts      int i8 u8 i16 u16 i32 u32 i64 u64
syn keyword vFloats    f32 f64
syn keyword vStructure enum struct

hi link vType      Type
hi link vInts      Type
hi link vFloats    Type
hi link vStructure Structure

" }}}
" ==============================================================================
" Constants
" ==============================================================================
" {{{

syn match vNumber    /\v([a-zA-Z_]\d*)@<!\d+(\.(\d+)?)?/
syn match vCharacter /\v`.`/
syn keyword vBoolean true false

hi link vNumber    Number
hi link vCharacter Character
hi link vBoolean   Boolean

" }}}
" ==============================================================================
" Strings
" ==============================================================================
" {{{

syn region vString start=/\vr?'/ end=/\v'/ skip=/\v(\\)@1<!\\'/
syn region vString start=/\vr?"/ end=/\v"/ skip=/\v(\\)@1<!\\"/

" String interpolations
syn match vSimpleInterpolation contained containedin=vString /\v(\\)@1<!\$\w+/
syn region vInterpolation      contained containedin=vString matchgroup=vSimpleInterpolation start=/\v(\\)@1<!\$\{/ end=/\V}/

hi link vString              String
hi link vSimpleInterpolation Special

" }}}
" ==============================================================================
" Statements
" ==============================================================================
" {{{

syn keyword vKeyword break
syn keyword vKeyword const
syn keyword vKeyword continue
syn keyword vKeyword fn
syn keyword vKeyword import
syn keyword vKeyword len
syn keyword vKeyword map
syn keyword vKeyword match
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

" }}}
" ==============================================================================
" Labels
" ==============================================================================
" {{{

" Match-blocks labels
syn region vMatchBlock start=/\v(match \w+ )@<=\{/ end=/\V}/ skip=/\v\{[^}]\}/ transparent
syn match vMatchLabel /\v\.?\w+\s*\{@=/he=e-1 contained containedin=vMatchBlock

hi link vMatchLabel Identifier

" }}}
" ==============================================================================
" Functions
" ==============================================================================
" {{{

syn match vFunctionCall        /\v \w+\(/he=e-1
syn match vMethodCall          /\v\.\w+\(/hs=s+1,he=e-1
syn match vFunctionDeclaration /\v(fn)@2<= \w+/
syn match vMethodDeclaration   /\v(fn \(\w+ \w+\))@<= \w+/

hi link vFunctionCall        Function
hi link vMethodCall          Function
hi link vFunctionDeclaration Title
hi link vMethodDeclaration   Title

" }}}
" ==============================================================================
" Modules
" ==============================================================================
" {{{

" Built-in
syn keyword vBuiltInModule math
syn keyword vBuiltInModule os

" User-defined
syn match vModuleName /\v((^import)@7<=|(^module)@7<=) \w+/

hi link vBuiltInModule Function
hi link vModuleName    Identifier

" }}}
" ==============================================================================
" Warnings
" ==============================================================================
" {{{

" Highlight lines containing statements ending with semicolons
syn match vWarning /\v.*;(\s*}|$)/

" Highlight conditions surrounded by parentheses
syn match vWarning /\v((if)@2<=|(else)@4<=) \([^)]*\)($| ?\{)/

hi link vWarning Error

" }}}
" ==============================================================================
" Comments
" ==============================================================================
" {{{

syn match  vComment          "\v//.*$"
syn region vMultiLineComment start="\v/\*" end="\v\*/" skip=/\v'|"|;/

syn keyword vTodo TODO FIXME contained containedin=vComment,vMultiLineComment

hi link vComment          Comment
hi link vMultiLineComment Comment
hi link vTodo             Todo

" }}}
" ==============================================================================
" Blocks
" ==============================================================================
" {{{

" syn region vFold start=/\v\{$/ end=/\v\}$/ transparent fold

" }}}
