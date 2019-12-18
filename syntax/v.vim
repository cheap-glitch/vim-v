
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
" Blocks
" ==============================================================================
" {{{

syn region vBlockFuncArgs       start=/\V(/   end=/\V)/        transparent contained
syn region vBlockConst          start=/\V(/   end=/\V)/   fold transparent contained
syn region vBlockElse           start=/\V{/   end=/\V}/   fold transparent contained
syn region vBlockEnum           start=/\V{/   end=/\V}/   fold transparent contained
syn region vBlockFunction       start=/\V{/   end=/\V}/   fold transparent contained
syn region vBlockIf             start=/\V{/   end=/\V}/   fold transparent contained
syn region vBlockMap            start=/\V{/   end=/\V}/   fold transparent contained
syn region vBlockMatch          start=/\V{/   end=/\V}/   fold transparent contained
syn region vBlockMatchBranch    start=/\V{/   end=/\V}/   fold transparent contained
syn region vBlockFuncParams     start=/\V(/   end=/\V)/        transparent contained skipwhite skipempty nextgroup=vReturnType,vBlockFunction
syn region vBlockStruct         start=/\V{/   end=/\V}/   fold transparent contained
syn region vBlockTypecast       start=/\V(/   end=/\V)/        transparent contained

syn match  vCondition           /\v.+(\{)@=/                   transparent contained skipwhite skipempty nextgroup=vBlockIf
syn match  vEnumName            /\v\w+/                        transparent contained skipwhite skipempty nextgroup=vBlockEnum
syn match  vStructName          /\v(\w|\.)+/                   transparent contained skipwhite skipempty nextgroup=vBlockStruct
syn match  vMatchedVar          /\v\w+/                        transparent contained skipwhite skipempty nextgroup=vBlockMatch
syn match  vReturnType          /\v\w+/                        transparent contained skipwhite skipwhite nextgroup=vBlockFunction

" }}}
" ==============================================================================
" Operators
" ==============================================================================
" {{{

syn match vOperator /\V+/
syn match vOperator /\V-/
syn match vOperator /\V*/
syn match vOperator "\V/"
syn match vOperator /\V%/
syn match vOperator /\V>/
syn match vOperator /\V</
syn match vOperator /\V++/
syn match vOperator /\V--/
syn match vOperator /\v[=!<>*/+-]?\=/
syn match vOperator /\V:=/ skipwhite skipempty nextgroup=vBlockMap

" }}}
" ==============================================================================
" Types
" ==============================================================================
" {{{

syn keyword vType       bool byte byteptr rune string voidptr  nextgroup=vBlockTypecast
syn keyword vInts       int i8 u8 i16 u16 i32 u32 i64 u64      nextgroup=vBlockTypecast
syn keyword vFloats     f32 f64                                nextgroup=vBlockTypecast
syn keyword vEnum       enum                                   nextgroup=vEnumName
syn keyword vStruct     struct                                 nextgroup=vStructName

" }}}
" ==============================================================================
" Constants
" ==============================================================================
" {{{

syn match vNumber    /\v([a-zA-Z_]\d*)@<!\d+(\.(\d+)?)?/
syn match vCharacter /\v`.`/
syn keyword vBoolean true false

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

" }}}
" ==============================================================================
" Statements
" ==============================================================================
" {{{

syn keyword vKeyword           break
syn keyword vKeyword           const     skipwhite skipempty nextgroup=vBlockConst
syn keyword vKeyword           continue
syn keyword vKeyword           fn
syn keyword vKeyword           import
syn keyword vKeyword           len
syn keyword vKeyword           map
syn keyword vKeyword           match     skipwhite skipempty nextgroup=vMatchedVar
syn keyword vKeyword           module
syn keyword vKeyword           mut
syn keyword vKeyword           return
syn keyword vConditional       else      skipwhite skipempty nextgroup=vBlockElse
syn keyword vConditional       if        skipwhite skipempty nextgroup=vCondition
syn keyword vConditional       or        skipwhite skipempty nextgroup=vBlockElse
syn keyword vConditional       switch
syn keyword vRepeat            for
syn keyword vRepeat            in
syn keyword vPub               pub

" Pre-compilaton conditionals
syn match   vPreCondStatement  /\v\$(if|else)/
syn region  vPreCond           start=/\V$if/ end=/\v$/ transparent
syn keyword vOS                linux mac windows       contained containedin=vPreCond
syn keyword vDebug             debug                   contained containedin=vPreCond

" C-style pre-proc
" @TODO

" }}}
" ==============================================================================
" Labels
" ==============================================================================
" {{{

syn match vMapKey      /\v^\s*\w+\s*:[^=]/he=e-2
syn match vConstName   /\v^\s*\w+\s*\=/he=e-1      contained containedin=vBlockConst
syn match vMatchLabel  /\v\.?\w+\s*\{@=/he=e-1     contained containedin=vBlockMatch skipwhite skipempty nextgroup=vBlockMatchBranch

" }}}
" ==============================================================================
" Functions
" ==============================================================================
" {{{

syn match vFunctionCall         /\v @1<=\w+\(/he=e-1          nextgroup=vBlockFuncArgs
syn match vMethodCall           /\v\.\w+\(/hs=s+1,he=e-1      nextgroup=vBlockFuncArgs
syn match vFunctionDeclaration  /\v(fn)@2<= \w+/              nextgroup=vBlockFuncParams
syn match vMethodDeclaration    /\v(fn \(\w+ \w+\))@<= \w+/   nextgroup=vBlockFuncParams

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

" }}}
" ==============================================================================
" Warnings
" ==============================================================================
" {{{
"
if !exists("g:v_warnings")
	let g:v_warnings=0
endif

if g:v_warnings
	" Highlight lines containing statements ending with semicolons
	syn match vWarning /\v.*;(\s*}|$)/

	" Highlight conditions surrounded by parentheses
	syn match vWarning /\v((if)@2<=|(else)@4<=) \([^)]*\)($| ?\{)/
endif

" }}}
" ==============================================================================
" Comments
" ==============================================================================
" {{{

syn match  vComment          "\v//.*$"
syn region vMultiLineComment start="\v/\*" end="\v\*/" skip=/\v'|"|;/

syn keyword vTodo TODO FIXME contained containedin=vComment,vMultiLineComment

" }}}
" ==============================================================================
" Highlight links
" ==============================================================================
" {{{

hi link   vBoolean               Boolean
hi link   vBuiltInModule         Function
hi link   vCharacter             Character
hi link   vComment               Comment
hi link   vConditional           Conditional
hi link   vConstName             Identifier
hi link   vDebug                 Debug
hi link   vEnum                  Structure
hi link   vFloats                Type
hi link   vFunctionCall          Function
hi link   vFunctionDeclaration   Title
hi link   vInts                  Type
hi link   vKeyword               Keyword
hi link   vLabel                 Label
hi link   vMapKey                Identifier
hi link   vMatchLabel            Identifier
hi link   vMethodCall            Function
hi link   vMethodDeclaration     Title
hi link   vModuleName            Identifier
hi link   vMultiLineComment      Comment
hi link   vNumber                Number
hi link   vOS                    PreCondit
hi link   vOperator              Operator
hi link   vPreCondStatement      PreCondit
hi link   vPub                   Special
hi link   vRepeat                Repeat
hi link   vSimpleInterpolation   Special
hi link   vString                String
hi link   vStruct                Structure
hi link   vTodo                  Todo
hi link   vType                  Type
hi link   vWarning               Error

" }}}
