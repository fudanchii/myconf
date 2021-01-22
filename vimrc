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
set clipboard=unnamedplus
set so=7
set laststatus=2
set maxmempattern=5000

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

let mapleader = "," 

noremap Q   <nop>
noremap :Q   :q
noremap <F9> :NERDTreeToggle<cr>
inoremap <F9> <Esc>:NERDTreeToggle<cr>i
inoremap <c-"> <esc>ci"

noremap <C-n> :tabn<cr>
noremap <C-p> :tabp<cr>
noremap <C-x> :tabclose<cr>
noremap <C-m> :tabmove<cr>
noremap <C-c>d :lcd%:p:h<cr>

noremap <leader>- ddp
noremap <leader>_ dd<up>P

nnoremap <leader>, :tabedit $MYVIMRC<cr>
nnoremap <leader>< :source $MYVIMRC<cr>
nnoremap <leader>p :set paste!<cr>
nnoremap <leader>n :noh<cr>
nnoremap <leader>t :vert term<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>p :r! cat /tmp/vitmp<cr>

vnoremap <leader>" <esc>`<i"<esc>`>i<right>"
vnoremap <leader>' <esc>`<i'<esc>`>i<right>'
vnoremap <leader>( <esc>`<i(<esc>`>i<right>)
vnoremap <leader>[ <esc>`<i[<esc>`>i<right>]
vnoremap <leader>{ <esc>`<i[<esc>`>i<right>}
vnoremap <leader>y :w! /tmp/vitmp<cr>

let g:ctrlp_map = '<c-a>'
let g:ctrlp_working_path_mode = '' 

set wildignore+=*/node_modules/*,*/tmp/*,*.so,*.swp,*.zip,*/.git/*,*/.hg/*

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

let g:go_template_use_pkg=1

let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_italicize_strings=1

let g:gruvbox_termcolors=256
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE

" mod status
set statusline=%#StatusLineTermNC#%m%*
" filename
set statusline+=%#TabLineSel#\ %.80f\ %*
" filetype & read-only status
set statusline+=\ %y\ %r
" current column, current line, and total line
set statusline+=%=%#PmenuThumb#\ %c\ %*%#PmenuSbar#\ %l/%L\ %*\ 

function! ModifiedColor()
  if &mod == 1
    hi statusline ctermfg=3 ctermbg=0
  else
    hi statusline ctermfg=4 ctermbg=15
  endif
endfunction

augroup modcolor
  au!
  au TextChanged                * call ModifiedColor()
  au InsertLeave,BufWritePost   * hi statusline ctermfg=4 ctermbg=15
  au InsertEnter                * hi statusline ctermfg=2 ctermbg=0
augroup END

augroup ftype
  au!
  au FileType typescript setlocal shiftwidth=2 softtabstop=2 expandtab
  au FileType typescript.tsx setlocal shiftwidth=2 softtabstop=2 expandtab
  au FileType crystal setlocal shiftwidth=2 softtabstop=2 expandtab
  au FileType racket source /home/adie/.vim/scripts/RainbowParenthsis.vim
  au FileType scheme source /home/adie/.vim/scripts/RainbowParenthsis.vim
augroup END

hi statusline ctermfg=4 ctermbg=15
