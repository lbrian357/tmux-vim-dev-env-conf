set nocompatible              " be iMproved, required
filetype off                  " required

"""""" vim-plug
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Plugins go here; Make sure you use single quotes
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-obsession'
Plug 'jpo/vim-railscasts-theme'
Plug 'sheerun/vim-polyglot'
Plug 'severin-lemaignan/vim-minimap'
Plug 'w0rp/ale'
Plug 'Valloric/MatchTagAlways'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'Xuyuanp/nerdtree-git-plugin' " NERDTree git status
Plug 'tpope/vim-dadbod' " DB Interaction
Plug 'vim-python/python-syntax' " Python Syntax
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nathanaelkane/vim-indent-guides'
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Unmanaged plugin (manually installed and updated)
""Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()


"Linting
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_linters = {
\ 'ruby': ['standardrb']
\}
let g:ale_fixers = {
\ 'javascript': ['prettier'],
\ 'javascriptreact': ['prettier'],
\ 'typescript': ['prettier'],
\ 'ruby': ['standardrb'],
\ 'python': ['black'],
\}
" Fix files automatically on save
" let g:ale_fix_on_save = 1

let g:ale_python_flake8_options = '--max-line-length=150'


"Colorscheme
colorscheme railscasts
"""set t_Co=256 
"""let g:solarized_termcolors=256
"if has('gui_running')
"  colorscheme monokai
"endif


"Settings Misc
"more powerful backspace, ie. fix the stupid original so called 'feature'
set backspace=indent,eol,start

"no newline at end of files
set noeol

"to make tabs == 2 spaces
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab
set autoindent
syntax enable
filetype indent on
filetype plugin on


"set python spaces
au BufNewFile,BufRead *.py set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd FileType python set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd FileType jsx setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType js setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType scss setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

"displays persistent full file path and name
set laststatus=2
set statusline=%<%F\ %h%m%r%y%=%-14.(%l,%c%V%)\ %P
hi StatusLine ctermbg=DarkBlue ctermfg=White
hi StatusLineNC ctermfg=249 guifg=#b2b2b2 ctermbg=237 guibg=#3a3a3a cterm=none gui=none

"highlights active line and column
set cursorline
set cursorcolumn
"displays line numbers
set number

"enable mouse in all modes
set mouse=a
"use mouse_sgr if it is an included feature, fixes 220 column limit on osx
if has("mouse_sgr")
  set ttymouse=sgr
elseif !has('nvim')
  set ttymouse=xterm2 "needed to enable drag resizing in vim in tmux"
endif


"Shortcuts and Remappings
"Ctrl-j to move down a split  
nnoremap <C-J> <C-W><C-J> 
"Ctrl-k to move up a split  
nnoremap <C-K> <C-W><C-K> 
"Ctrl-l to move    right a split  
nnoremap <C-L> <C-W><C-L> 
"Ctrl-h to move left a split  
nnoremap <C-H> <C-W><C-H> 
"Ctrl-m to maximize a pane
nnoremap <C-W>m <C-W>|
"map expand current window to max size
map <C-W>e <C-W>\|<C-W>_ 

map <Enter> i<Enter><ESC>
map <Space> :
"map <C-Enter> O<ESC>

"map <ctrl-n> as nerdtree shortcut
map <C-n> :NERDTreeToggle<CR>

"fzf remapping to ctrl-p
nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>


"Allows \r in normal mode to execute sql file, 
"or in visual mode to execute only the current selection
"NB -1 == --single-transaction to wrap your queries in a transaction
"argument to -f is to tell psql to read from standar input
map <leader>r :w !psql -d mydb -1 -f -<cr>


""Autoload and autosave folds
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview
""enables automatic folds by indent level
""but also allows manual folds
"augroup vimrc
"  au BufReadPre * setlocal foldmethod=indent
"  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
"augroup END


"expand carriage returns (for js)
let delimitMate_expand_cr=1

"Sets Tab to autocomplete for coc.nvim
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
