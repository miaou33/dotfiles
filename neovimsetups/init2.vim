set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

set number

" ===========SYNTAX=========== 
" Enable type file detection. Vim will be able to try to detect the type of file in use.  
filetype on 
" Enable plugins and load plugin for the detected file type.
filetype plugin on
" Load an indent file for the detected file type.
filetype indent on
" help w/ tabs
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
" make wildmenu behave like similar to Bash completion.
set wildmode=list:longest
" ignore files which cant be modified by vim
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
" Show the mode you are on the last line.
set showmode
" Show matching words during a search.
set showmatch
" ignorecase when searching
set ignorecase

let mapleader = " "
nnoremap <leader>e :bufdo e!<CR>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

nnoremap <leader>c :colo sept22evatheme<CR>

"===========NERDTree=========
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Set keybindings
nnoremap <C-n> :NERDTree<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


"==========COLORS============
if (&t_Co != 256)
  set t_Co=256
endif
colorscheme sept22evatheme
"autocmd BufRead,BufNewFile * syn match parens /[(){}]/
