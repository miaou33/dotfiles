set mouse=a
set number " Disable compatibility with vi which can cause unexpected issues.  set nocompatible ===========SYNTAX=========== Enable type file detection. Vim will be able to try to detect the type of file in use.  filetype on Enable plugins and load plugin for the detected file type.
filetype plugin on
" Load an indent file for the detected file type.
filetype indent on
" help w/ tabs
set autoindent
set smartindent
set cindent
"set tab to match ecole42
set tabstop=4
set shiftwidth=4
set softtabstop=4
" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap
set colorcolumn=81

"===========CMD===========
"Help file related settings
" search down into subfolders with :find just use wildcard operator !!
set path+=**
" display all matching files when tab complete
set wildmenu
" make wildmenu behave like similar to Bash completion.
set wildmode=list:longest
" ignore files which cant be modified by vim
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
" show partial command you type in the last line of the screen
set showcmd
" Show the mode you are on the last line.
set showmode
" Show matching words during a search.
set showmatch
" Use highlighting when doing a search.
set hlsearch
set incsearch
" ignorecase when searching
set ignorecase
" Set the commands to save in history default number is 20.
set history=1000

let mapleader = " "
nnoremap <leader>e :bufdo e!<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"nnoremap <Esc> <Esc> <Esc> :nohl<CR>
nnoremap <leader>c :colo eva<CR>

"==========Syntaxic========
"execute pathogen#infect()
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0


"==========NERDTree=========
" Start NERDTree and put the cursor back in the other window.
"autocmd VimEnter * NERDTree | wincmd p
" Set keybindings
nnoremap <C-n> :NERDTree<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"==========TIDAL=============
"call plug#begin('~/.vim/plugged')
"Plug 'tidalcycles/vim-tidal'
"call plug#end()

"==========COLORS============
syntax enable
"if (&t_Co != 256)
"  set t_Co=256
"endif
colorscheme koehler
"autocmd BufRead,BufNewFile * syn match parens /[(){}]/
