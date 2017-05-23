filetype plugin indent on

" Tabularize /,\zs

au BufNewFile,BufRead *.spec set filetype=inispec

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
set colorcolumn=80
set textwidth=80


syntax sync fromstart
syntax on

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
hi SpecialKey ctermfg=blue
hi StatusLine ctermfg=green
hi LineNr ctermfg=blue
hi Visual ctermfg=blue ctermbg=white cterm=reverse

" GPG
nmap <F9> :%!gpg --output - --clearsign --armor - 2>/dev/null <CR>:redraw!<CR>
nmap <C-F9> :%!gpg --output - --encrypt --armor - 2>/dev/null <CR>:redraw!<CR>
nmap <S-F9> :w !gpg --verify<CR>

nmap go :let output=system('xdg-open '.expand('<cfile>'))<CR>
nmap gr :grep <cword> %:p:h/*<CR>

set hlsearch
hi Search cterm=NONE ctermbg=lightyellow
set number
set background=light
set laststatus=2
set ttimeoutlen=50
set scrolloff=10
set title
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Enable_Fold_Column = 0
let tlist_tex_settings = 'latex;l:labels;s:sections;t:subsections;u:subsubsections'

let g:miniBufExplorerAutoStart = 1
let g:miniBufExplBuffersNeeded = 1

nmap <C-Up> ddkP
nmap <C-Down> ddp

" Transparent editing of gpg encrypted files.
" By Wouter Hanegraaff
augroup encrypted
  au!

  " First make sure nothing is written to ~/.viminfo while editing
  " an encrypted file.
  autocmd BufReadPre,FileReadPre *.gpg set viminfo=
  " We don't want a various options which write unencrypted data to disk
  autocmd BufReadPre,FileReadPre *.gpg set noswapfile noundofile nobackup

  " Switch to binary mode to read the encrypted file
  "autocmd BufReadPre,FileReadPre *.gpg set bin
  "autocmd BufReadPre,FileReadPre *.gpg let ch_save = &ch|set ch=2
  " (If you use tcsh, you may need to alter this line.)
  "autocmd BufReadPost,FileReadPost *.gpg '[,']!gpg --decrypt 2> /dev/null
  autocmd BufReadPost,FileReadPost *.gpg %!gpg -d 2> /dev/null

  " Switch to normal mode for editing
  "autocmd BufReadPost,FileReadPost *.gpg set nobin
  "autocmd BufReadPost,FileReadPost *.gpg let &ch = ch_save|unlet ch_save
  "autocmd BufReadPost,FileReadPost *.gpg execute ":doautocmd BufReadPost " . expand("%:r")

  " Convert all text to encrypted text before writing
  " (If you use tcsh, you may need to alter this line.)
  "autocmd BufWritePre,FileWritePre *.gpg '[,']!gpg --default-recipient-self -ae 2>/dev/null
  "autocmd BufWritePre,FileWritePre *.gpg '[,']!gpg -c -a 2>/dev/null
  " Undo the encryption so we are back in the normal text, directly
  " after the file has been written.
  "autocmd BufWritePost,FileWritePost *.gpg u
augroup END
