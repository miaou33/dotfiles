"------COLORS----------
"8 grey
"46 fluo green
"93 purple
"99	slate blue 1 (purple)
"104 medium purple close to slate grey
"135 medium purple 2
"141 medium purple 1
"147 light steel blue
"82 green yellow
"171 medium orchid 1
"177 violet
"189 light steel blue 1
"207 medium orchid
"214 orange 1 
"220 gold 1
"221 light golden rod 2

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

hi Normal ctermfg=189

hi Comment	term=italic ctermfg=248
hi cComment ctermfg=248


"===CONSTANT===
hi Constant	term=underline ctermfg=189
  syn match negNumber /\(-[0-9]\)/
  hi link negNumber Constant
  "hi cOperator ctermfg=171		        	      "sizeof
  syn match NonAlnumChar /\(\\$\|"\|'\|,\|+\|<\|=\|>\|- \|->\|!\|"[\ \*\ ]"\)/
hi NonAlnumChar ctermfg=213 cterm=bold 
  syn match BracketsParen /{\|}\|(\|)\|\[\|\]/ 
hi BracketsParen ctermfg=93 cterm=bold

"===IDENTIFIER===
hi Identifier ctermfg=93
hi Function ctermfg=141 

"===STATEMENT====
"while, if, else, etc
hi Statement ctermfg=82
  syn match OrAndOperators /\(&&\|||\ze\)/
  hi link OrAndOperators Statement
  syn match SemiColum "[;]"
  hi link SemiColum Statement

"===PREPROC===
hi PreProc	term=underline	ctermfg=82
hi Macro ctermfg=135
  "hi cDefine ctermfg=

"===TYPE===
hi Type	term=underline ctermfg=117
hi cType ctermfg=117
  syn match defType /t_[a-zA-Z0-9_]\+/
  hi link defType cType
  syn match globalType /g_[a-zA-Z0-9_]\+/
  hi link globalType cType
hi link StorageClass cType "ctermfg=221 cterm=italic

"===SPECIAL===
" ? | cspecial = escaped chars
hi Special ctermfg=93
hi cSpecial ctermfg=189

"===ERROR&INFOS===
hi Ignore ctermfg=black
hi Error cterm=reverse ctermbg=Red ctermfg=White
hi Todo	term=standout ctermbg=46 ctermfg=Black
hi LineNr ctermfg=248
hi ExtraWhitespace ctermbg=248
  syn match ExtraWhitespace /\s\+$/
hi colorcolumn ctermbg=none ctermfg=82 cterm=bold
hi VertSplit ctermfg=247
hi StatusLine ctermfg=247
hi StatusLineNC ctermfg=247

"   \ze matches at any position, and sets the end of the match there,
"   \s whitespace character,
"   . matches any single character,
"   \{-} matches 0 or more of the preceding atom, as few as possible,
"   \(\) braces can be used to make a pattern into an atom,
"   \| is "or" operator in a pattern.

":let s=synID(line('.'), col('.'), 1) | echo synIDattr(s, 'name') . ' -> ' . synIDattr(synIDtrans(s), 'name')
