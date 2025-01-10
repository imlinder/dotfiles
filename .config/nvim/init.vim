set nocompatible

set shortmess+=I  "Remove startup message
set history=10000  "Increase history entries (default: 20 in vim, 10000 in neovim)
set undodir=~/.vimundo/
set undofile
set directory=~/.vimswap
set nowrap
" set nu
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

autocmd Filetype go setlocal noexpandtab

set guicursor=i:block

"Show all tabs, show trailing spaces
set listchars=tab:▸\ ,trail:·
set list

set nohlsearch "Don't highlight search pattern
set incsearch

lua require("config")

let g:netrw_banner = 0

" Look and colors {{{1

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

" Fugitive
nnoremap <leader>gs :Git<CR>
" nnoremap <leader>gb :Git blame<CR>

"Insert Datestamp
inoremap <F5> <C-R>=strftime("%c")<CR>
nnoremap <F5> "=strftime("%c")<CR>P

" Folding {{{1

autocmd FileType vim setlocal foldmethod=marker

