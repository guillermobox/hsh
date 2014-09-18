set autoindent
filetype plugin indent on
hi ColorColumn ctermbg=lightblue guibg=lightblue

set nowrap
set backspace=indent,eol,start
set list
set list listchars=tab:\|\ ,trail:»
set fillchars+=vert:\ 
set number

filetype on

nmap <F5> :make<CR>
nmap <F6> :cnext<CR>
nmap <F7> :cprev<CR>
nmap <F2> :bprev<CR>
nmap <F3> :bnext<CR>

set background=light
set mouse=a

