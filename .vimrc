"---------------------------------------
" Plug
"----------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/mru.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'sjl/badwolf'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }

call plug#end()


"----------------------------------------
" SET OPTIONS
"----------------------------------------
syntax enable  " use syntax highlight.
colorscheme badwolf  " Use badwolf scheme (installed by Plug)
filetype plugin indent on  " filetype detection, indent rules etc.
set number  " Setting [relative]number gives nice combo.
set relativenumber
set showcmd  " Show incomplete commands.
set mouse=a  " Allow mouse usage.
set autoread  " autoread changes to file from outside
set wildmenu  " Show completion mathces in minibuffer
set wildignore=*.o,*~,*.pyci,*/.git/*,*/.DS_Store  " Ignore compiled files, git and OSX files
set ruler  " Always show current position.
set backspace=eol,start,indent  " Backspace should work as expected.
set ignorecase  " Ignore case in search.
set smartcase  " Unless there is uppercase in search term.
set hlsearch  " Highlight search results.
set incsearch  " Search incrementaly as term is typed.
set lazyredraw  " Don't redraw while exec. macros (performance).
set magic  " Enable regular expressions.
set showmatch  " Highlight matching brackets when over one.
set encoding=utf8  " UTF-8 as standard encoding.
set nobackup  " Don't make a backup file (rely on git).
set expandtab  " Use spaces, not tabs.
set smarttab  " Sensible tab handling.
set shiftwidth=4  " 1 tab == 4 spaces.
set tabstop=4     " 1 tab == 4 spaces.
set autoindent  " Auto indent newline
set smartindent  " Do smart indent of new line
set laststatus=2
" Format the status line
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

"----------------------------------------
" GENERAL MAPPINGS
"----------------------------------------
" Typing jk in insert mode will exit to normal mode
inoremap jk <esc>
" Remap VIM 0 to first non-blank character
map 0 ^
" Search using space.
map <space> /
" Disable highlight on <leader><cr>
map <leader><cr> :noh<cr>
" List open buffers and promt for number or filename.
nnoremap gb :buffers<CR>:b<Space>
" Emacs style kill buffer
nnoremap <leader>db :buffers<CR>:bdelete<Space>
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
" Toggle paste mode on and off.
map <leader>pp :setlocal paste!<cr>
" Quickly open a markdown buffer for scribble
map <leader>q :e ~/buffer.md<cr>
" Toggle NERDTree
map <leader>nn :NERDTreeToggle<cr>

"----------------------------------------
" Spell Checking
"----------------------------------------
map <leader>ss :setlocal spell!<cr>

"----------------------------------------
" Syntax Checking (Syntastic defaults)
"----------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Auto delete trailing white space on save for some filetypes.
autocmd FileType c,cpp,java,python autocmd BufWritePre <buffer> :%s/\s\+$//e

"----------------------------------------
" Airline Status Bar
"----------------------------------------
let g:airline_powerline_fonts = 1  " Needed to fix special symbols.

"----------------------------------------
" PYTHON
"----------------------------------------
" Enable running python script with
autocmd FileType python nnoremap <buffer> <F9> :exec '!clear && python3' shellescape(@%, 1)<cr>
