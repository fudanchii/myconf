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
set ruler
set noswapfile
set nobackup
set nowb
set autoread
set wildmenu
set hid
set nolazyredraw
set so=7
set gfn=Consolas\ 14
if has('gui_running')
    set background=dark
else
    set background=dark
endif
colorscheme solarized
filetype plugin indent on

imap <F6> <Esc>:NERDTreeToggle<CR><F7>
map <F6> :NERDTreeToggle<CR><F7>

imap <F7> <Esc>:TMiniBufExplorer<cr>
map <F7> :TMiniBufExplorer<cr>

map :tn :tabn<cr>
map :tp :tabp<cr>
map :te :tabedit
map :tc :tabclose<cr>
map :tm :tabmove

au FileType python syn keyword pythonDecorator self

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 0
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplVSplit = 25
let g:miniBufExplSplitBelow=1

