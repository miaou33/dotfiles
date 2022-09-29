" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Highlight cursor line underneath the cursor horizontally.
"set cursorline
"set cursorcolumn

" your mouse will work
set mouse=a

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" highlights as you type search string
set incsearch

" help w/ tabs
set autoindent
set smartindent
set cindent

" Keep current color settings
syntax enable
" to override with default
"syntax on

" set line number
set number

" ignorecase when searching
set ignorecase

"highlights matches when searching
set showmatch

"set tab to match ecole42
set tabstop=4
set shiftwidth=4
set softtabstop=4

"Help file related settings
" search down into subfolders with :find just use wildcard operator !!
set path+=**

" Display all matching files when tab complete
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx


" Show partial command you type in the last line of the screen.
set showcmd
" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" The cterm color numbers refer to XTerm colors in 256 color mode.
" see <:help syntax> for group names
"
" Normal must be set before colors "fg" and "bg" can be used.
highlight Normal ctermfg=189

highlight Comment ctermfg=DarkGrey

" *Constant / char, str, number,  boolean, float, ...
highlight Constant ctermfg=147
highlight String ctermfg=104
"highlight Character ctermfg=
highlight Number ctermfg=141
highlight Boolean ctermfg=141
highlight Float ctermfg=141

" *Identifier : any variable name
highlight Identifier ctermfg=207
highlight Function ctermfg=135 "cterm=bold

" *Statements
highlight Statement ctermfg=46
highlight cStatement ctermfg=46
highlight Conditional ctermfg=46		"if else switch
highlight Repeat ctermfg=46				"while for do
highlight Operator ctermfg=220			"?
highlight cOperator ctermfg=220			"sizeof
highlight Exception ctermfg=46			"try, catch, throw
"highlight Keyword ctermfg=				"any other keyword

" *Preproc
highlight Preproc ctermfg=

" *Type
highlight Type ctermfg=207
highlight cType ctermfg=207				"int8_t, etc
highlight StorageClass ctermfg=207		"static, register, volatile, etc
highlight cStorageClass ctermfg=207
highlight Structure ctermfg=207
highlight cStructure ctermfg=207
highlight Typedef ctermfg=207

" *Special
highlight Special ctermfg=221
highlight NonText ctermfg=221
"highlight cSpecial ctermfg=221	"escaped chars (with \ in front)


highlight ExtraWhitespace ctermbg=DarkGrey
match ExtraWhitespace /\s\+$/

"---------COLORS----------
"46  fluo green
"99	 slate blue 1 (purple)
"104 medium purple
"135 medium purple 2
"141 medium purple 1
"147 light steel blue
"189 light steel blue 1
"207 medium orchid (fushia pink)
"214 orange 1 
"220 gold 1
"221 light golden rod 2

"to set bold-> add cterm=bold (same for italic, underline,...)
"
