" your mouse will work
set mouse=a

" highlights as you type search string
set incsearch

" help w/ tabs
set autoindent
set smartindent
set cindent

" Syntax colours
syntax on

" set line number
set number

" ignorecase when searching
set ignorecase

"highlights matches when searching
set showmatch

"highlight current line
set cursorline

"set tab to match ecole42
set tabstop=4
set shiftwidth=4
set softtabstop=4

"@DaiClement whitespace trick
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"Help file related settings
" search down into subfolders with :find just use wildcard operator !!
set path+=**

" Display all matching files when tab complete
set wildmenu
