set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ctrlp.vim'

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'tpope/vim-obsession'

Plugin 'jpo/vim-railscasts-theme'
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
if has('gui_running')
"  colorscheme monokai
endif




"to make tabs 2 spaces
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

"displays persistent full file path and name
set laststatus=2
set statusline=%<%F\ %h%m%r%y%=%-14.(%l,%c%V%)\ %P

nnoremap <C-J> <C-W><C-J> "Ctrl-j to move down a split  
nnoremap <C-K> <C-W><C-K> "Ctrl-k to move up a split  
nnoremap <C-L> <C-W><C-L> "Ctrl-l to move    right a split  
nnoremap <C-H> <C-W><C-H> "Ctrl-h to move left a split  

map <Enter> o<ESC>
map <Space> :
"map <C-Enter> O<ESC>
"ctrlp - fuzzy finding file search plugin
"set runtimepath^=~/.vim/bundle/ctrlp.vim

"autoload and autosave folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

"enable mouse in all modes
set mouse=a
