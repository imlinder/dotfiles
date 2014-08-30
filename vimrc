" Misc/Not sorted {{{1

set nocompatible


source $HOME/.vim/bundles.vim

filetype on
filetype plugin on
filetype indent on

set shortmess+=I  "Remove startup message
set scrolloff=3   "Minimum lines to keep above and below cursor
set nowrap        "Turn off line wrapping
set history=10000

" Look {{{1

set number        "Turn on line numbering
set cursorline    "Highlight current line

" Color scheme
syntax on
let &t_Co=256
if has('gui_running')
  set background=dark
  colorscheme wombat
else
  colorscheme molokai
endif

" Font
if has('gui_running')
  set anti enc=utf-8
  set guifont=DejaVu\ Sans\ Mono:h13
endif

" Cursor
set guicursor=a:block-Cursor
set guicursor+=a:blinkon0

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" Indentation
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" Mappings {{{1

map <Space> <leader>

" Edit/source vimrc
nnoremap <leader>VE :edit $MYVIMRC<cr>
nnoremap <leader>VS :source $MYVIMRC<cr>

" Easy escape from insert mode.
imap jk <Esc>
imap jj <Esc>

" Emmet
imap hh <C-y>,

" Folds
nnoremap <Space><Space> za
nnoremap <Space>f za

" Quickly open netrw
noremap <Leader>. :vspl. <Enter>
noremap <Leader>: :spl. <Enter>

" Datestamp
inoremap <F5> <C-R>=strftime("%c")<CR>
nnoremap <F5> "=strftime("%c")<CR>P

"Save file as sudo even if not opened as such
cmap w!! w !sudo tee > /dev/null %

"Searching {{{1

" highlight search pattern
set hlsearch
hi Search guibg=#FBB829 guifg=black

"Keep cursor in the center when moving to next/previous search match.
nnoremap n nzz
nnoremap N Nzz

"Dont move on *
nnoremap * *<c-o>

" File type specific {{{1

" vim {{{2

autocmd FileType vim setlocal foldmethod=marker

" Javascript {{{2

" Folding
au FileType javascript call JavaScriptFold()

" Plugin settings {{{1

" vim-notes {{{2

let g:notes_directories = ['~/Dropbox/Notes']
"Swap Files {{{1

set noswapfile
set nobackup
set nowb

"Status line {{{1

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

set laststatus=2 "Always show statusline

set statusline=
set statusline+=\ [%n]%m%r%h%w  "Buffer number, modified, readonly, help, preview
set statusline+=\ %.41F\    "Filepath with maximum width
set statusline+=%=          "Right align
set statusline+=%{fugitive#statusline()}
set statusline+=\ %{FileSize()}
set statusline+=\ %Y        "Filetype
set statusline+=\ %l/%L\    "Current/total lines

