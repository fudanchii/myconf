syntax on
set backspace=eol,start,indent
set nocompatible
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set expandtab
set showmatch
set incsearch
set hlsearch
set ruler
set noswapfile
set nobackup
set nowb
set autoread
set wildmenu
set hid
set nolazyredraw
set foldmethod=indent
set foldnestmax=1
set foldlevel=1
set nofoldenable
set so=7
if has('gui_running')
    set background=light
    set gfn=Consolas\ 14
else
    let g:solarized_termtrans = 1
    set background=dark
endif
colorscheme solarized
filetype plugin indent on

map <F9> :NERDTreeToggle<cr>
imap <F9> <Esc>:NERDTreeToggle<cr>

map <C-n> :tabn<cr>
map <C-p> :tabp<cr>
map <C-c> :tabclose<cr>
map :tm :tabmove<cr>
map :te :tabedit 

au FileType python syn keyword pythonDecorator self

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

