let mapleader=","
let g:netrw_preview = 1

execute pathogen#infect()

filetype plugin indent on

set t_Co=256
set background=dark
syntax enable

colorscheme monokai

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
set autochdir
set exrc
set secure

fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

fun! SplitWorkspaceFromCurrent()
  let components = ["controller", "model"]

  for component in components
    execute 'S' . component
  endfor
  :vs db/schema.rb
endfun

map <space> V

map <leader>a <C-W><C-H>
map <leader>s <C-W><C-L>
map <leader>d <C-W><C-K>
map <leader>f <C-W><C-L>

map <leader>fa :Ack
map <leader>VE :Vex<CR>
nnoremap <leader>S :call SplitWorkspaceFromCurrent()<CR>
nnoremap <leader>+ :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
