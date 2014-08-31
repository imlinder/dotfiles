filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins {{{
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'xolox/vim-misc' "Needed for vim-notes
Plugin 'xolox/vim-notes'

" Make gvim-only colorschemes work transparently in terminal vim
Plugin 'godlygeek/csapprox'
" }}}
" Syntax {{{
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'jelera/vim-javascript-syntax'
" }}}
" Colorschemes {{{
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'zefei/cake16'
Plugin 'vim-scripts/Wombat'
Plugin 'wombat256.vim'
" }}}

call vundle#end()
