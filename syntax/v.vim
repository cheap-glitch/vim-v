
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

syn region vBlockArgs       start=/\V(/ end=/\V)/ transparent      contained
syn region vBlockConst      start=/\V(/ end=/\V)/ transparent fold contained
syn region vBlockElse       start=/\V{/ end=/\V}/ transparent fold contained
syn region vBlockEnum       start=/\V{/ end=/\V}/ transparent fold contained
syn region vBlockFunction   start=/\V{/ end=/\V}/ transparent fold contained
syn region vBlockMap        start=/\V{/ end=/\V}/ transparent fold contained
syn region vBlockMatch      start=/\V{/ end=/\V}/ transparent fold contained
syn region vBlockParams     start=/\V(/ end=/\V)/ transparent      contained
syn region vBlockStruct     start=/\V{/ end=/\V}/ transparent fold contained
syn region vBlockTypecast   start=/\V(/ end=/\V)/ transparent      contained containedin=vBlockTypecast

" }}}
" ==============================================================================
" Operators
" ==============================================================================
" {{{

syn match vOperator /\V+/
syn match vOperator /\V-/
syn match vOperator /\V*/
syn match vOperator "\V/"
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

syn keyword vType      bool byte byteptr rune string voidptr nextgroup=vBlockTypecast
syn keyword vInts      int i8 u8 i16 u16 i32 u32 i64 u64     nextgroup=vBlockTypecast
syn keyword vFloats    f32 f64                               nextgroup=vBlockTypecast
syn keyword vStructure enum struct

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

syn keyword vKeyword      break
syn keyword vKeyword      const     skipwhite skipempty nextgroup=vBlockConst
syn keyword vKeyword      continue
syn keyword vKeyword      fn
syn keyword vKeyword      import
syn keyword vKeyword      len
syn keyword vKeyword      map
syn keyword vKeyword      match
syn keyword vKeyword      module
syn keyword vKeyword      mut
syn keyword vKeyword      return
syn keyword vConditional  else      skipwhite skipempty nextgroup=vBlockElse
syn keyword vConditional  if        skipwhite skipempty nextgroup=vCondition
syn keyword vConditional  or        skipwhite skipempty nextgroup=vBlockElse
syn keyword vConditional  switch
syn keyword vRepeat       for
syn keyword vRepeat       in
syn keyword vLabel        case
syn keyword vLabel        default
syn keyword vPub          pub

" Pre-compilaton conditionals
syn region  vPreCond      start=/\V$if/ end=/\v$/ transparent
syn match   vPreCondIf    /\V$if/                 contained containedin=vPreCond
syn match   vPreCondElse  /\V$else/
syn keyword vOS           linux mac windows       contained containedin=vPreCond
syn keyword vDebug        debug                   contained containedin=vPreCond

" }}}
" ==============================================================================
" Labels
" ==============================================================================
" {{{

syn match vMapKey     /\v^\s*\w:/he=e-1        contained containedin=vBlockMap
syn match vConstName  /\v^\s*\w+\s*\=/he=e-1   contained containedin=vBlockConst
syn match vMatchLabel /\v\.?\w+\s*\{@=/he=e-1  contained containedin=vBlockMatch

" }}}
" ==============================================================================
" Functions
" ==============================================================================
" {{{

syn match vFunctionCall        /\v @1<=\w+\(/he=e-1         nextgroup=vBlockArgs
syn match vMethodCall          /\v\.\w+\(/hs=s+1,he=e-1     nextgroup=vBlockArgs
syn match vFunctionDeclaration /\v(fn)@2<= \w+/             nextgroup=vBlockParams
syn match vMethodDeclaration   /\v(fn \(\w+ \w+\))@<= \w+/  nextgroup=vBlockParams

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

" Highlight lines containing statements ending with semicolons
syn match vWarning /\v.*;(\s*}|$)/

" Highlight conditions surrounded by parentheses
syn match vWarning /\v((if)@2<=|(else)@4<=) \([^)]*\)($| ?\{)/

" }}}
" ==============================================================================
" Comments
" ==============================================================================
" {{{

syn match vComment "\v//.*$"
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
hi link   vPreCondIf             PreCondit
hi link   vPub                   Special
hi link   vRepeat                Repeat
hi link   vSimpleInterpolation   Special
hi link   vString                String
hi link   vStructure             Structure
hi link   vTodo                  Todo
hi link   vType                  Type
hi link   vWarning               Error

" }}}
