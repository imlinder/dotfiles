filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Colorschemes {{{
Plugin 'w0ng/vim-hybrid'
" }}}
" Plugins {{{
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'sjl/gundo.vim'
Plugin 'shougo/vimfiler.vim'
Plugin 'shougo/unite.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
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

call vundle#end()
