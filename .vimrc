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
Plug 'itchyny/lightline.vim'
Plug 'cocopon/lightline-hybrid.vim'
"Plug 'edkolev/tmuxline.vim'
"Use this fork until PR with support for termguicolors for lightline has been merged
Plug 'hoov/tmuxline.vim', { 'branch': 'truecolor-lightline'}
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

" coc {{{1
let g:coc_global_extension = ['coc-git', 'coc-json', 'coc-tailwindcss', 'coc-tsserver', 'coc-phpls']

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

" Syntax highligting {{{1

"set cursorline    "Highlight current line
"set cursorcolumn  "Highlight current column

filetype plugin indent on

if exists('+termguicolors')
  set termguicolors
else
  set t_Co=256
endif

if &t_Co > 2
  syntax on
endif

set background=dark
let ayucolor="light"
let ayucolor="mirage"

if &t_Co >= 256
  colorscheme ayu
  let g:palenight_terminal_italics=1
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
"au FileType javascript call JavaScriptFold()

" Status line {{{1

set laststatus=2 "Always show statusline

let g:lightline = { 
	\'colorscheme': 'ayu',
	\ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
	\ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
\}
"let g:lightline = { 'colorscheme': 'ayu' }

let g:tmuxline_preset = 'ayu'

if exists('$TMUX')
	au InsertEnter * Tmuxline lightline_insert
	au InsertLeave * Tmuxline lightline
endif

let g:tmuxline_powerline_separators = 0

let g:tmuxline_status_justify = 'center'

let g:tmuxline_preset = {
  \'a'   : '#S',
  \'b'   : '#W',
  \'c'   : '#I #P',
  \'win' : '#I #W',
  \'cwin': '#I #W',
  \'x'   : '#(battery Charging) #[fg=#ffcb6b]#(battery Discharging)',
  \'y'   : '%a %d %b %R'}


" Plugin specific {{{1

"Vimwiki

let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/', 'path_html': '~/Dropbox/vimwiki/_html/', 'syntax': 'markdown', 'ext': '.md'}]

"Ack
if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif

