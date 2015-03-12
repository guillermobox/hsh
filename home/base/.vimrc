filetype plugin indent on

au BufNewFile,BufRead *.spec set filetype=inispec

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

nmap <F1> :Tlist<CR>
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
hi SpecialKey ctermfg=brown

" GPG
nmap <F9> :%!gpg --output - --clearsign --armor - 2>/dev/null <CR>:redraw!<CR>
nmap <C-F9> :%!gpg --output - --encrypt --armor - 2>/dev/null <CR>:redraw!<CR>
nmap <S-F9> :w !gpg --verify<CR>

nmap go :let output=system('xdg-open '.expand('<cfile>'))<CR>

set number
set background=light
set laststatus=2
set ttimeoutlen=50
set scrolloff=10
set title
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Enable_Fold_Column = 0
let tlist_tex_settings = 'latex;l:labels;s:sections;t:subsections;u:subsubsections'

nmap <C-Up> ddkP
nmap <C-Down> ddp

