filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'tpope/vim-surround'

" Make gvim-only colorschemes work transparently in terminal vim
Plugin 'godlygeek/csapprox'

Plugin 'jelera/vim-javascript-syntax'

call vundle#end()
