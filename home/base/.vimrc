filetype plugin indent on

set hidden
set nocompatible
set nohlsearch
set autoindent
set mouse=a
set wildmode=longest,list,full
set wildmenu
set nowrap
set backspace=indent,eol,start
set list
set list listchars=tab:\│\ ,trail:»
set fillchars+=vert:\ 
set textwidth=80

syntax sync fromstart
syntax on

nmap <F2> :bprev<CR>
nmap <F3> :bnext<CR>
nmap <F4> :Bclose<CR>
nmap <F5> :make<CR>
nmap <F7> :cnext<CR>
nmap <F6> :cprev<CR>
nmap <F8> :cwindow<CR>

set spelllang=en_gb
nmap <S-F5> :set spell!<CR>
nmap <S-F6> [s
nmap <S-F7> ]s
nmap <S-F8> z=
nmap <C-S-F8> zg

nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l

hi SpellBad term=underline cterm=underline ctermfg=Red ctermbg=none
hi SpecialKey ctermfg=blue
hi StatusLine ctermfg=green
hi LineNr ctermfg=blue
hi Visual ctermfg=blue ctermbg=white cterm=reverse

nmap go :let output=system('xdg-open '.expand('<cfile>'))<CR>
nmap gr :grep <cword> %:p:h/*<CR>

set hlsearch
hi Search cterm=NONE ctermbg=lightyellow
set background=light
set laststatus=2
set ttimeoutlen=50
set scrolloff=10
set title

nmap <C-Up> ddkP
nmap <C-Down> ddp
