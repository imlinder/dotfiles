"filetype off

if empty( glob('~/.vim/autoload/plug.vim') )
	!mkdir -p ~/.vim/autoload/
	!curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')

" Plugin 'gmarik/Vundle.vim'

" Colorschemes {{{
Plug 'w0ng/vim-hybrid'
Plug 'NLKNguyen/papercolor-theme'
" }}}
" Plugins {{{
Plug 'itchyny/lightline.vim'
Plug 'cocopon/lightline-hybrid.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'mbbill/undotree'
Plug 'shougo/vimfiler.vim'
Plug 'shougo/unite.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/syntastic'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vimwiki/vimwiki'
Plug 'Valloric/YouCompleteMe'
Plug 'craigemery/vim-autotag'
Plug 'mileszs/ack.vim'
Plug 'kien/ctrlp.vim'
" }}}
" Syntax {{{
Plug 'cakebaker/scss-syntax.vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'zaiste/tmux.vim'
Plug 'StanAngeloff/php.vim'
Plug 'tpope/vim-markdown'
" }}}

call plug#end()
