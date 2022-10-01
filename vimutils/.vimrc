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

"syntax enable
colorscheme sept22evatheme
autocmd BufRead,BufNewFile * syn match parens /[(){}]/

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

" Show partial command you type in the last line of the screen.>
set showcmd
" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

