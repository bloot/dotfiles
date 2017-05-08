let mapleader=","

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

function! PrReview()
  let l:pulls_json = maktaba#syscall#Create([
      \ 'curl',
      \ ("-H Authorization: token " + $GITHUB_TOKEN),
      \ $GITHUB_REPO_URL + '/pulls']).Call().stdout
  let l:pulls = maktaba#json#Parse(l:pulls_json)
  echomsg "Pulls:"
  for l:pr in l:pulls
    echomsg printf("  #%d: %s", l:pr.number, l:pr.title)
  endfor
endfunction

let g:netrw_preview = 1

map <space> V

map <leader>a <C-W><C-H>
map <leader>s <C-W><C-L>

nnoremap <leader>+ :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
