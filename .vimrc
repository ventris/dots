" ======== PLUGINS ========
call plug#begin('~/.vim/plugged')

Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'vim-syntastic/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rodjek/vim-puppet'
" tag file generation and syntax highlighting of tags
Plug 'xolox/vim-misc'
" show tags of current file in a window
Plug 'majutsushi/tagbar'

" Syntax Hilighting
Plug 'cespare/vim-toml'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()


" ======== CHARSET ========
scriptencoding utf-8
set encoding=utf-8


" ======== VISUAL ========
syntax on
color tomorrow-theme

set termguicolors

set background=dark

" set colorcolumn=81
" highlight ColorColumn guifg=black guibg=lightblue

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = []

" ======== EDITING ========

" join the new millenium
set nocompatible

set ruler

" disable bleeping and screen flashing
set vb
set t_vb=

" specific list chars
set list
set list listchars=tab:».,trail:·,extends:€,eol:$

"use 2 spaces to represent tab
set tabstop=2
set softtabstop=2
" number of spaces to use for auto indent
set shiftwidth=2
" copy indent from current line when starting a new line
set autoindent
" expand tabs to spaces
set expandtab

" make backspace work like you'd expect in insert mode
set backspace=indent,eol,start

" use system clipboard as default clipboard
set clipboard=unnamed

" number of lines to keep above and below the cursor
set scrolloff=5

" show line numbers
set number
" make line numbers relative to the current line
set relativenumber

" highlight search result
set hlsearch
" ignore search case
set ignorecase
" unless you use capitals
set smartcase
" make sarches always appear in centre of page
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
" clear search highlighting with enter
nnoremap <cr> :noh<CR><CR>:<backspace>


" F9 to toggle paste mode
nnoremap <silent><F9> :set paste!<CR>

" ======== MISCELLANEOUS ========

set showcmd

" force unix fileformat
set fileformat=unix

" enable mouse selection
"set mouse=a

" increase max number of files you can open as tabs with -p command line option
set tabpagemax=50

" make swapfiles be kept in a central location to avoid polluting file system
set directory^=$HOME/.vim/swapfiles//

" use undodir for persistent undoing across file closure
set undodir=~/.vim/undodir
set undofile

" visual autocomplete for command menu
set wildmenu
" make tab completion in wildmenu work like bash
set wildmode=longest:full,full

" switch tabs with Ctrl left and right
nnoremap <C-right> :tabnext<CR>
nnoremap <C-left> :tabprevious<CR>
" and whilst in insert mode
inoremap <C-right> <Esc>:tabnext<CR>
inoremap <C-left> <Esc>:tabprevious<CR>
" and whilst inside screen / tmux
map <Esc>[C <C-Right>
map <Esc>[D <C-Left>
map <Esc>[1;5D <C-Left>
map <Esc>[1;5C <C-Right>
" and whilst inside screen / tmux and insert mode
map! <Esc>[C <C-Right>
map! <Esc>[D <C-Left>
map! <Esc>[1;5D <C-Left>
map! <Esc>[1;5C <C-Right>


" ======== FILE STUFF ========

autocmd BufNewFile *_test.py r ~/.boilerplates/python_test.py

" Locals for specific filetypes
autocmd FileType py  setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType python  setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType go  setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType golang  setlocal ts=4 sts=4 sw=4 noexpandtab

" ======== NERDTREE ========

" set toggle to C-n
map <C-n> :NERDTreeToggle<CR>

" ======== STATUS BAR ========

" always show status bar
"set laststatus=1
" enable vim-airline plugins
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 1
"let g:airline_theme='bubblegum'
let g:airline_theme='minimalist'


" ======== TAGS ========

let g:easytags_async = 1
let g:easytags_auto_highlight = 0

" Toggle Tagbar
nmap <C-m> :TagbarToggle<CR>

" open tag under cursor in new tab with C-\
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>


" ======== CTRLP ========

" only search for things under the directory that you opened vim from
"let g:ctrlp_working_path_mode = ''

" ignore temp files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc

" don't index inside node_modules or dist directories
"let g:ctrlp_custom_ignore = '\v[\/](node_modules|dist)$'

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }


" ===== BREAK BAD HABIT =====
" Unbind the cursor keys in insert, normal and visual modes.
"for prefix in ['i', 'n', 'v']
"  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
"    exe prefix . "noremap " . key . " <Nop>"
"  endfor
"endfor

