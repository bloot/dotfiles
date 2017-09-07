let mapleader=","

filetype plugin indent on
set t_Co=256
set background=dark
syntax enable
colorscheme monokai


execute pathogen#infect()

set shell=/bin/bash
set swapfile
set dir=~/tmp
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
set splitbelow
set splitright
set mouse=a

map <space> V

" Map keys on other side of keyboard to
" swap current pane
map <leader>a <C-W><C-H>
map <leader>s <C-W><C-J>
map <leader>d <C-W><C-K>
map <leader>f <C-W><C-L>

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <leader>a :TmuxNavigateLeft<cr>
nnoremap <silent> <leader>s :TmuxNavigateDown<cr>
nnoremap <silent> <leader>d :TmuxNavigateUp<cr>
nnoremap <silent> <leader>f :TmuxNavigateRight<cr>

nnoremap <leader>cw yiw<CR>
nnoremap <leader>cl yy<CR>
nnoremap <leader>fa :Ack

nnoremap <leader>+ :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>


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
nnoremap <leader>S :call SplitWorkspaceFromCurrent()<CR>

if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

