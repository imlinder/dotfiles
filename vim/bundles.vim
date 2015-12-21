filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins {{{
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'airblade/vim-gitgutter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vimwiki/vimwiki'
" }}}
" Syntax {{{
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'zaiste/tmux.vim'
Plugin 'StanAngeloff/php.vim'
Plugin 'tpope/vim-markdown'
" }}}
" Colorschemes {{{
Plugin 'wombat256.vim'
Plugin 'summerfruit256.vim'
Plugin 'wellsjo/wells-colorscheme.vim'
Plugin 'w0ng/vim-hybrid'
let g:hybrid_use_Xresources = 1
" }}}

call vundle#end()
