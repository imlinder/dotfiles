" Misc {{{1

set nocompatible

source $HOME/.vim/bundles.vim "Plugins loaded with Vundle

set backspace=2 "Fix terminal backspace issue

set shortmess+=I  "Remove startup message
set nowrap        "Turn off line wrapping
set history=5000  "Increase history entries (default: 20)

" Swap {{{1

set directory=~/.vimswap

" Syntax highligting {{{1

set cursorline    "Highlight current line
set cursorcolumn  "Highlight current column

filetype plugin indent on

if &t_Co > 2
  syntax on
endif

set background=dark

if &t_Co >= 256
  colorscheme hybrid
endif

" Html syntax on ejs and handlebar files
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.hbs set filetype=html

" Indentation {{{1

set expandtab "Spaces instead of tabs
set autoindent
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2

set listchars=tab:▸\ ,trail:· "Show all tabs, show all trailing spaces
set list

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

"Toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" Edit/source vimrc
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

"Expand Emmet
imap hh <C-y>,

" Quickly open file browser
noremap <Leader>: :vspl. <Enter>
noremap <Leader>. :spl. <Enter>

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

let g:airline_powerline_fonts = 1

let g:airline_theme='hybridline'

"set statusline=
"set statusline+=\ [%n]%m%r%h%w  "Buffer number, modified, readonly, help, preview
"set statusline+=\ %.41F\        "Filepath with maximum width
"set statusline+=%=              "Right align
"set statusline+=%{fugitive#statusline()}
"set statusline+=\ %{FileSize()}
"set statusline+=\ %Y            "Filetype
"set statusline+=\ %l/%L\ %c     "Current/total lines column


" Plugin specific {{{1

"Tmuxline

let g:tmuxline_preset = {
  \'a'   : '#S',
  \'b'   : '#W',
  \'c'   : '#I #P',
  \'win' : '#I #W',
  \'cwin': '#I #W',
  \'x'   : '#(battery Charging) #[fg=red]#(battery Discharging)',
  \'y'   : '%a %d %b %R',
  \'z'   : '#H'}

"Vimwiki

let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/', 'path_html': '~/Dropbox/vimwiki/_html/', 'syntax': 'markdown', 'ext': '.md'}]

