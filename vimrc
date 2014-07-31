execute pathogen#infect()

set shortmess+=I  "Remove startup message

set number        "Turn on line numbering
set cursorline    "Highlight current line
set scrolloff=3   "Minimum lines to keep above and below cursor

syntax on
set background=dark
colorscheme molokai

if $TERM == "xterm-256color"
  set t_Co=256
endif

if has('gui_running')
  set anti enc=utf-8
  set guifont=Source\ Code\ Pro\ Light:h14
endif

" highlight search pattern
set hlsearch
hi Search guibg=#FBB829 guifg=black

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

imap jk <Esc>
imap kj <Esc>
imap kk <Esc>
imap jj <Esc>

" Keep cursor in the center when moving to next/previous search match.
nnoremap n nzz
nnoremap N Nzz

" Dont move on *
nnoremap * *<c-o>

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

" ================ Status Line ======================

set laststatus=2
set statusline=
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " flags and buf no
set statusline+=%-40f\                    " path
set statusline+=%=%1*%y%*%*\              " file type
set statusline+=%10((%l,%c)%)\            " line and column
set statusline+=%P   
