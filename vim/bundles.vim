filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins {{{
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'airblade/vim-gitgutter'
Plugin 'christoomey/vim-tmux-navigator'
" }}}
" Syntax {{{
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'zaiste/tmux.vim'
" }}}
" Colorschemes {{{
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/Wombat'
Plugin 'wombat256.vim'
Plugin 'summerfruit256.vim'
" }}}

call vundle#end()
