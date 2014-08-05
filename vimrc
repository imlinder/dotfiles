set nocompatible
"{{{ Vundle

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'cakebaker/scss-syntax.vim'

call vundle#end()
filetype plugin indent on

"}}}
















"Reload vimrc when saved
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

let mapleader=" "

set shortmess+=I  "Remove startup message
set number        "Turn on line numbering
set cursorline    "Highlight current line
set scrolloff=3   "Minimum lines to keep above and below cursor
set nowrap        "Turn off line wrapping
set history=10000

" Color scheme
syntax on
set background=dark
colorscheme molokai
let &t_Co=256

" Font
if has('gui_running')
  set anti enc=utf-8
  set guifont=Source\ Code\ Pro\ Light:h12
endif

" highlight search pattern
set hlsearch
hi Search guibg=#FBB829 guifg=black

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" Indentation
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" Easy escape from insert mode.
imap jk <Esc>
imap jj <Esc>

" Emmet
imap hh <C-y>,

" Quickly open netrw
noremap <Leader>. :vspl. <Enter>
noremap <Leader>: :spl. <Enter>

" Datestamp
inoremap <F5> <C-R>=strftime("%c")<CR>
nnoremap <F5> "=strftime("%c")<CR>P

"Save file as sudo even if not opened as such
cmap w!! w !sudo tee > /dev/null %

"Keep cursor in the center when moving to next/previous search match.
nnoremap n nzz
nnoremap N Nzz

"Dont move on *
nnoremap * *<c-o>

"Turn Off Swap Files
set noswapfile
set nobackup
set nowb

"Status line
function! FileSize()
let bytes = getfsize(expand("%:p"))
if bytes <= 0
return ""
endif
if bytes < 1024
return bytes
else
return (bytes / 1024) . "k"
endif
endfunction

hi User1 guibg=#84CD22  guifg=white ctermbg=green
hi User2 guibg=#FF0952  guifg=white ctermbg=red

set laststatus=2 "Always show statusline

set statusline=
set statusline+=\ [%n]%m%r%h%w  "Buffer number, modified, readonly, help, preview 
set statusline+=\ %.40F\    "Filepath with maximum width
set statusline+=%=          "Right align
set statusline+=%{FileSize()}
set statusline+=\ %1*       "Color 1
set statusline+=\ %Y        "Filetype
set statusline+=\ %2*       "Color 2
set statusline+=\ %l/%L\    "Current/total lines




" Scss
" au BufRead,BufNewFile *.scss set filetype=scss.css
