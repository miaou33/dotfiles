" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Highlight cursor line underneath the cursor horizontally.
set cursorline
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

" Syntax colours
syntax on

"color shemes : DARK- macvim256 (neon purple and dark other colours) photon (grey purple) neverland
"darker (colorful yellow/dark) ir_black (black + soft but not too much blue/purple/green ...nut not enough rough maybe) adaryn (blue asfck) herokudock-gvim (yellow/grey/black) reloaded (fluo green matrix )
"LIGHT- home (minimalist) soft-era (fucked up) minimal (grey white black)
"eva01 (but terne) darkest-space (purple and shit) horseradish256 (grey and
"kinda yellow/neon green) aquamarine (black & grey, neon blue, fade others <3)
"dracula (dracula) aura (cool purple - shades of pink - soft tuquoise with
"very black bckgd) )
"alabaster (white pink black<3) ayumi (cool) damnpaul (windows96 alike)
"toothpik (cool colors, grey bckgrnd) soso (same) cake (cool cute)
"OTHERS - sweets (illisible pink th<3) sweet-lolita (omg pinky) hotdog (abuse)
"tomato soup (lolll)

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

"@DaiClement whitespace trick
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

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


