set nocompatible

set shortmess+=I  "Remove startup message
set backspace=2   "Fix terminal backspace issue
set history=10000  "Increase history entries (default: 20 in vim, 10000 in neovim)
if has("persistent_undo")
  set undodir=~/.vimundo/
  set undofile
endif
set directory=~/.vimswap
set nowrap
set nu
set signcolumn=yes
set nospell
set spelllang=en
set nofixendofline

set expandtab
set autoindent
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2

set guicursor=i:block

set listchars=tab:▸\ ,trail:· "Show all tabs, show trailing spaces
set list

set hlsearch "Highlight search pattern
set incsearch

" Plugins {{{1

" Install plug.vim if it's not yet installed
if empty( glob('~/.vim/autoload/plug.vim') )
  !mkdir -p ~/.vim/autoload/
  !curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'Raimondi/delimitMate'
Plug 'vimwiki/vimwiki'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Lualine
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Syntax
Plug 'cakebaker/scss-syntax.vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'zaiste/tmux.vim'
Plug 'StanAngeloff/php.vim'
Plug 'nelsyeung/twig.vim'

" Colorschemes
Plug 'ayu-theme/ayu-vim'

call plug#end()

" }}}

lua require("configs")

let g:netrw_banner = 0

let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/', 'path_html': '~/Dropbox/vimwiki/_html/', 'syntax': 'markdown', 'ext': '.md'}]

" coc {{{1
let g:coc_global_extension = ['coc-git', 'coc-eslint', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-phpls', 'coc-explorer', 'coc-tailwindcss', 'coc-prettier']
autocmd FileType scss setl iskeyword+=@-@
nnoremap <leader>o :CocCommand explorer<CR>
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Look and colors {{{1

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

" Html syntax on ejs and handlebar files
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.hbs set filetype=html

" Yaml indentation
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Mappings {{{1

"Use space as leader
map <Space> <leader>

"Easy escape from insert mode.
imap jk <Esc>

"Keep cursor in the center when moving to next/previous search match.
nnoremap n nzz
nnoremap N Nzz

"Dont move on *
nnoremap * *<c-o>

imap <C-j> <CR><Esc>O

"Toggle folds
"nnoremap <Leader>f za

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

" Folding {{{1

autocmd FileType vim setlocal foldmethod=marker
autocmd FileType json setlocal foldmethod=syntax
"au FileType javascript call JavaScriptFold()

