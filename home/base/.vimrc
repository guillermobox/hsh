set nocompatible
set autoindent
filetype plugin indent on

set wildmode=longest,list,full
set wildmenu

set nowrap
set backspace=indent,eol,start
set list
set list listchars=tab:\|\ ,trail:»
set fillchars+=vert:\ 

nmap <F1> :Tlist<CR>
nmap <F2> :bprev<CR>
nmap <F3> :bnext<CR>
nmap <F4> :Bclose<CR>
nmap <F5> :make<CR>
nmap <F6> :cnext<CR>
nmap <F7> :cprev<CR>
nmap <F8> :cwindow<CR>

set number

set background=light
set laststatus=2
set ttimeoutlen=50

"hi ColorColumn ctermbg=lightblue guibg=lightblue
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/
