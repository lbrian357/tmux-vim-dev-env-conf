set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlp.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-obsession'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'pangloss/vim-javascript'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'mxw/vim-jsx'
Plugin 'w0rp/ale'
Plugin 'Valloric/MatchTagAlways'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-endwise'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax enable
filetype indent on
filetype plugin on

"colorscheme
colorscheme railscasts
"""set t_Co=256 
"""let g:solarized_termcolors=256
"if has('gui_running')
"  colorscheme monokai
"endif

"more powerful backspace, ie. fix the stupid original so called 'feature'
set backspace=indent,eol,start

"to make tabs == 2 spaces
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

"displays persistent full file path and name
set laststatus=2
set statusline=%<%F\ %h%m%r%y%=%-14.(%l,%c%V%)\ %P

"Ctrl-j to move down a split  
nnoremap <C-J> <C-W><C-J> 
"Ctrl-k to move up a split  
nnoremap <C-K> <C-W><C-K> 
"Ctrl-l to move    right a split  
nnoremap <C-L> <C-W><C-L> 
"Ctrl-h to move left a split  
nnoremap <C-H> <C-W><C-H> 

map <Enter> i<Enter><ESC>
map <Space> :
"map <C-Enter> O<ESC>
"ctrlp - fuzzy finding file search plugin
"set runtimepath^=~/.vim/bundle/ctrlp.vim
"ctrlp - fix stupid file search limit ie. allows unlimited
let g:ctrlp_max_files=0

"autoload and autosave folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

"enable mouse in all modes
set mouse=a

"use mouse_sgr if it is an included feature, fixes 220 column limit on osx
if has("mouse_sgr")
  set ttymouse=sgr
endif

"map <ctrl-n> as nerdtree shortcut
map <C-n> :NERDTreeToggle<CR>

"allows \r in normal mode to execute sql file, 
"or in visual mode to execute only the current selection
"NB -1 == --single-transaction to wrap your queries in a transaction
"argument to -f is to tell psql to read from standar input
map <leader>r :w !psql -d mydb -1 -f -<cr>

"enables automatic folds by indent level
"but also allows manual folds
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
