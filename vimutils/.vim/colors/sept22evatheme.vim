"------COLORS----------
"8 grey
"46 fluo green
"93 purple
"99	slate blue 1 (purple)
"104 medium purple close to slate grey
"135 medium purple 2
"141 medium purple 1
"147 light steel blue
"154 green yellow
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

hi Constant	term=underline ctermfg=189
"hi Character ctermfg=
"hi String ctermfg=
"hi Number ctermfg=194
"hi Boolean ctermfg=141
"hi Float ctermfg=141
"hi Operator ctermfg=171
"hi cOperator ctermfg=171		        	      "sizeof

hi Identifier ctermfg=93
hi Function ctermfg=141 cterm=bold "147  "111  147

hi Statement ctermfg=154                "while, if, etc
"hi cStatement ctermfg=213

hi PreProc	term=underline	ctermfg=154
hi Macro ctermfg=135
"hi cDefine ctermfg=

"ADD TYPE t_* g_*
hi Type	term=underline ctermfg=213 "213
"hi cType ctermfg=171                             "int8_t, etc
hi StorageClass	cterm=italic  ctermfg=213                    "static, register, volatile, etc
"hi Structure ctermfg=171
"hi Typedef ctermfg=171

hi Ignore ctermfg=black
hi Error cterm=reverse ctermbg=Red ctermfg=White
hi Todo	term=standout ctermbg=46 ctermfg=Black

hi Special	term=bold ctermfg=189
hi NonText ctermfg=221
"hi cSpecial ctermfg=221	"escaped chars (with \ in front)
"hi MatchParen ctermfg=221
"hi parens ctermfg=221

hi LineNr ctermfg=248

hi ExtraWhitespace ctermbg=234
syn match ExtraWhitespace /\s\+$/

"syn match NonAlnum
hi NonAlnumChar ctermfg=213 cterm=bold "171 "183
syn match NonAlnumChar /\(,\|+\|<\|=\|>\|-\|!\)/

hi SpecialNonAlnum ctermfg=154
syn match SpecialNonAlnum /\(&&\|||\ze\)/

hi SemiColum ctermfg=154
syn match SemiColum "[;]"

"hi BracketsParen ctermfg=214
"syn match BracketsParen "[\{\}]"

hi Paren ctermfg=93 cterm=bold "147
syn match Paren "[\{\}\(\)\[\]]"

"columns separating vim windows
hi VertSplit ctermfg=247
hi ToolbarLine ctermfg=247

"   \ze matches at any position, and sets the end of the match there,
"   \s whitespace character,
"   . matches any single character,
"   \{-} matches 0 or more of the preceding atom, as few as possible,
"   \(\) braces can be used to make a pattern into an atom,
"   \| is "or" operator in a pattern.

":let s = synID(line('.'), col('.'), 1) | echo synIDattr(s, 'name') . ' -> ' . synIDattr(synIDtrans(s), 'name')
