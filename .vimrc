set nocompatible

"source $HOME/.vim/bundles.vim "Plugins loaded with vim plug

" Plugins {{{1

" Install plug.vim if it's not yet installed
if empty( glob('~/.vim/autoload/plug.vim') )
  !mkdir -p ~/.vim/autoload/
  !curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')

" Plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/syntastic'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vimwiki/vimwiki'
Plug 'mileszs/ack.vim'
Plug 'kien/ctrlp.vim'

" Syntax
Plug 'cakebaker/scss-syntax.vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'zaiste/tmux.vim'
Plug 'StanAngeloff/php.vim'
Plug 'tpope/vim-markdown'
Plug 'nelsyeung/twig.vim'

" Colorschemes
Plug 'w0ng/vim-hybrid'
Plug 'NLKNguyen/papercolor-theme'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ayu-theme/ayu-vim'

call plug#end()

" }}}

" Misc {{{1
set backspace=2 "Fix terminal backspace issue

set shortmess+=I  "Remove startup message
set nowrap        "Turn off line wrapping
set history=5000  "Increase history entries (default: 20)

set nospell
set spelllang=en

set nofixendofline


" coc {{{1
let g:coc_global_extension = ['coc-git', 'coc-json', 'coc-tailwindcss', 'coc-css', 'coc-tsserver', 'coc-phpls']
autocmd FileType scss setl iskeyword+=@-@

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Swap/undofile {{{1

set directory=~/.vimswap

if has("persistent_undo")
  set undodir=~/.vimundo/
  set undofile
endif

" Look and colors {{{1

"set cursorline    "Highlight current line
"set cursorcolumn  "Highlight current column

function! AdjustAyu() abort
  highlight VertSplit cterm=NONE ctermbg=NONE ctermfg=231 gui=NONE guibg=NONE guifg=##000000
endfunction

augroup MyColorAdjustments
  autocmd!
  autocmd ColorScheme ayu call AdjustAyu()
augroup END

filetype plugin indent on

set background=dark

if exists('+termguicolors')
  set termguicolors
  let ayucolor="mirage"
  colorscheme ayu
else
  set t_Co=256
endif

if &t_Co > 2
  syntax on
endif

if &t_Co >= 256
endif



" Html syntax on ejs and handlebar files
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.hbs set filetype=html

" Indentation {{{1

set noexpandtab
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4

set listchars=tab:▸\ ,trail:· "Show all tabs, show trailing spaces
set list

" Yaml indentation
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" netrw {{{1

let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_winsize = 25
nnoremap - :e dummynetrwbuf \| Explore \| bw! dummynetrwbuf <CR>
"noremap <Leader>. :Vex <Enter>
"noremap <Leader>. :spl. <Enter>


" Misc mappings {{{1

"Use space as leader
map <Space> <leader>

"Easy escape from insert mode.
imap jk <Esc>

imap <C-j> <CR><Esc>O

"Toggle folds
nnoremap <Leader>f za

"Toggle line numbers
nnoremap <Leader>nu :set nu!<Enter>

"Fugitive
nnoremap <leader>gs :Gstatus<CR>

"Toggle undotree
nnoremap <leader>u :UndotreeToggle<CR>

" Edit/source vimrc
nnoremap <leader>ev :tabnew $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

"Expand Emmet
imap hh <C-y>,

"Insert Datestamp
inoremap <F5> <C-R>=strftime("%c")<CR>
nnoremap <F5> "=strftime("%c")<CR>P

"Save file as sudo even if not opened as such
cmap w!! w !sudo tee > /dev/null %

" Searching {{{1

" highlight search pattern
set hlsearch

"Keep cursor in the center when moving to next/previous search match.
nnoremap n nzz
nnoremap N Nzz

"Dont move on *
nnoremap * *<c-o>


" Folding {{{1

autocmd FileType vim setlocal foldmethod=marker
autocmd FileType json setlocal foldmethod=syntax
"au FileType javascript call JavaScriptFold()

" Status line {{{1

" Custom statusline
" -----------------
set laststatus=2 "Always show statusline

set statusline=

" Statusline left
" Git branch
set statusline+=%#PmenuSel#
set statusline+=%#Pmenu#
set statusline+=%{fugitive#statusline()}
set statusline+=%r%m%h%w
set statusline+=\ \%.30F
set statusline+=\ %#StatusLine#

" Statusline right
set statusline+=%=
" File encoding
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
" Type of file
set statusline+=\ %y
" Percentage, line:column
set statusline+=\ %p\%%\ %l:%c


" Plugin specific {{{1

"CtrlP
let g:ctrlp_custom_ignore = 'node_modules\|dist\|git'

let g:ctrlp_prompt_mappings = {
  \ 'PrtSelectMove("j")':   ['<c-n>', '<down>'],
  \ 'PrtSelectMove("k")':   ['<c-p>', '<up>'],
  \ 'PrtHistory(-1)':       ['<c-j>'],
  \ 'PrtHistory(1)':        ['<c-k>'],
    \ }

"Vimwiki

let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/', 'path_html': '~/Dropbox/vimwiki/_html/', 'syntax': 'markdown', 'ext': '.md'}]

"Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

