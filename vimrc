execute pathogen#infect()

set number        "Turn on line numbering

syntax on

if $TERM == "xterm-256color"
  set t_Co=256
endif

if has('gui_running')
  set anti enc=utf-8
  set guifont=Source\ Code\ Pro\ Light:h14
endif

set background=dark

colorscheme base16-ocean

map <C-n> :NERDTreeToggle<CR> "Open NERDTree with ctrl+n

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

set smartindent
set tabstop=2
set shiftwidth=2
set expandtab


