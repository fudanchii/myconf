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
"set foldmethod=indent
"#set foldnestmax=4
"#set foldlevel=3
set clipboard=unnamedplus
set so=7

"colorscheme solarized
filetype plugin indent on

if has('gui_running')
    set background=light
    if has('unix')
        set gfn=Consolas\ 14
    else
        set gfn=Consolas:h14
    endif
else
    let g:solarized_termtrans=1
    set background=dark
endif

map Q   <nop>
map :Q   :q
map <F9> :NERDTreeToggle<cr>
imap <F9> <Esc>:NERDTreeToggle<cr>

map <C-n> :tabn<cr>
map <C-p> :tabp<cr>
map <C-x> :tabclose<cr>
map :tm :tabmove<cr>
map :te :tabedit 
map <C-c>d :lcd%:p:h<cr>

let g:ctrlp_map = '<c-b>'
let g:ctrlp_working_path_mode = 'ra' 

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.git/*,*/.hg/*

au FileType python syn keyword pythonDecorator self

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

execute pathogen#infect()
