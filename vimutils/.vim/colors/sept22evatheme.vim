" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Ron Aaron <ron@ronware.org>
" Last Change:	2003 May 02

"------COLORS----------
"8 grey
"46  fluo green
"99	 slate blue 1 (purple)
"104 medium purple close to slate grey
"135 medium purple 2
"141 medium purple 1
"147 light steel blue
"154 green yellow
"171 medium orchid 1
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
let g:colors_name = "eva"
hi Normal ctermfg=189

hi Comment	term=italic ctermfg=DarkGrey
hi cComment ctermfg=DarkGrey

hi Constant	term=underline ctermfg=141
"hi Character ctermfg=
"hi String ctermfg=
"hi Number ctermfg=141
"hi Boolean ctermfg=141
"hi Float ctermfg=141
"hi Operator ctermfg=171
"hi cOperator ctermfg=171		        	      "sizeof

hi Identifier ctermfg=99
hi Function ctermfg=99 "cterm=bold

hi Statement term=bold ctermfg=154
"hi cStatement ctermfg=46
"hi Conditional ctermfg=46                        "if else switch
"hi Repeat ctermfg=46                   	      "while for do
"hi Exception ctermfg=46                          "try, catch, throw

hi PreProc	term=underline	ctermfg=171
hi Macro ctermfg=141
"hi cDefine ctermfg=

hi Type	term=underline ctermfg=171
"hi cType ctermfg=171                             "int8_t, etc
"hi StorageClass ctermfg=171	cterm=italic      "static, register, volatile, etc
"hi cStorageClass ctermfg=171 cterm=italic
"hi Structure ctermfg=171
"hi cStructure ctermfg=171
"hi Typedef ctermfg=171
"hi cTypedef ctermfg=171

hi Ignore ctermfg=black
hi Error cterm=reverse ctermbg=Red ctermfg=White
hi Todo	term=standout ctermbg=46 ctermfg=Black

hi Special	term=bold ctermfg=141
"hi NonText ctermfg=221
"hi cNonText ctermfg=221
"hi cSpecial ctermfg=221	"escaped chars (with \ in front)
"hi cBracket ctermfg=221
"hi cBlock ctermfg=221
"hi MatchParen ctermfg=221
hi parens ctermfg=221

"syn match NonAlnumSpec [&&] [- ]
hi NonAlnum ctermfg=171
syn match NonAlnum "[+!<=>|]"

hi Brackets ctermfg=221
syn match Brackets "[()]"

hi LineNr ctermfg=DarkGrey

hi ExtraWhitespace ctermbg=DarkGrey
match ExtraWhitespace /\s\+$/

