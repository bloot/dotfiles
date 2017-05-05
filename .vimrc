let mapleader = ","

execute pathogen#infect()

filetype plugin indent on

syntax enable
colorscheme monokai
set t_Co=256

set backspace=indent,eol,start

set tabstop=2 expandtab shiftwidth=2

set number

set showmatch

set smartcase

set hlsearch
set incsearch

set history=1000
set undolevels=1000

set wildignore=*.swp,*.bak,*.log

set pastetoggle=<F2>

set autochdir
set tags+=./tags;

fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()


let g:netrw_preview = 1

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <Leader>+ :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <Leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
