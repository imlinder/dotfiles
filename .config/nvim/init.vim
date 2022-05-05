set nocompatible

set shortmess+=I  "Remove startup message
set history=10000  "Increase history entries (default: 20 in vim, 10000 in neovim)
set undodir=~/.vimundo/
set undofile
set directory=~/.vimswap
set nowrap
set nu
set signcolumn=yes
set nospell
set spelllang=en
set nofixendofline
set noshowmode

set expandtab
set autoindent
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2

set guicursor=i:block

"Show all tabs, show trailing spaces
set listchars=tab:▸\ ,trail:·
set list

set nohlsearch "Don't highlight search pattern
set incsearch

" Plugins {{{1

" Install plug.vim if it's not yet installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'christoomey/vim-tmux-navigator'

" LSP
Plug 'neovim/nvim-lspconfig'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" LSP Autocomplete
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" Formatting
Plug 'mhartington/formatter.nvim'

" File tree
Plug 'kyazdani42/nvim-tree.lua'

" Git
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

Plug 'mbbill/undotree'

Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
" Plug 'Raimondi/delimitMate'
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
" Plug 'yuezk/vim-js'
" Plug 'maxmellon/vim-jsx-pretty'
Plug 'zaiste/tmux.vim'
" Plug 'StanAngeloff/php.vim'
" Plug 'nelsyeung/twig.vim'

Plug 'cormacrelf/dark-notify'

" Colorschemes
Plug 'ayu-theme/ayu-vim'
Plug 'EdenEast/nightfox.nvim'

call plug#end()

" }}}

lua require("configs")

let g:netrw_banner = 0

let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/', 'path_html': '~/Dropbox/vimwiki/_html/', 'syntax': 'markdown', 'ext': '.md'}]

" Look and colors {{{1

set background=dark

if exists('+termguicolors')
  set termguicolors
  let ayucolor="mirage"
  colorscheme nightfox
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
" nnoremap * *<c-o>

imap <C-j> <CR><Esc>O

" nnoremap <leader>gtn :cnext<CR>
" nnoremap <leader>gtp :cprev<CR>
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap [b :bprevious<CR>
nnoremap ]t :tabnext<CR>
nnoremap [t :tabprevious<CR>

"Toggle folds
"nnoremap <Leader>f za

"Toggle line numbers
nnoremap <silent><Leader>nu :set nu!<Enter>

"Toggle undotree
nnoremap <leader>u :UndotreeToggle<CR>

"Toggle filetree
nnoremap <silent><leader>o :NvimTreeToggle<CR>

" Edit/source vimrc
nnoremap <silent><leader>ev :tabnew $MYVIMRC<CR>
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

