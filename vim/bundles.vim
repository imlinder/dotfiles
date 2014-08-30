filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'

Plugin 'xolox/vim-misc' "Needed for vim-notes
Plugin 'xolox/vim-notes'

Plugin 'cakebaker/scss-syntax.vim'
Plugin 'jelera/vim-javascript-syntax'

" Make gvim-only colorschemes work transparently in terminal vim
Plugin 'godlygeek/csapprox'

" Colorschemes
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'zefei/cake16'
Plugin 'vim-scripts/Wombat'

call vundle#end()
