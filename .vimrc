set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
Plugin 'vitalk/vim-simple-todo'
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

" Change leader to a comma, because the default backslash is too far away
let mapleader=","
" Show line number
set number 
" Show relative number
set relativenumber
" Allow backspace in insert mode
set backspace=indent,eol,start
" File-type highlighting and configuration
" Run :filetype (without argv) to see config
syntax on
" highlight matching [{()}]
set showmatch
" No annoying sound on errors
set visualbell
set t_vb=
" Don't show the intro message when starting Vim
set shortmess=atI
" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
" Show command in bottom bar
set showcmd
" Keep longer history
set history=1000
" Make command comletion useful press <TAB> to complete
set wildmenu
" Turn of swapfile, backup
set noswapfile
set nobackup
" Ignore case when searching unless we type a capital
set ignorecase
set smartcase
" Set title
set title
" Highlight searches by default
set hlsearch
" Highlight dynamically as pattern is typed
set incsearch
" Enable mouse in all modes
set mouse=a
" Always show the status line
set laststatus=2
" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
" Highlight current cursor line
set cursorline
" Set cursorline colors
highlight CursorLine ctermbg=235
" Use the OS clipboard by default
set clipboard=unnamed

" => Mapping things"
" Mapping <C-n> to turn off highlight searches 
nmap <silent> <leader>n :silent :nohlsearch<CR>
" Mapping <C-s> to save when file has been changed
nmap <leader>s :update<CR>
" Press * or # searches for the current selection (in visual mode)
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>
" Mapping <C-te> to open file in current directory with new tab
map <leader>te :tabedit <c-r>=expand("%:p:h")<CR>/
" Mapping <C-cd> to switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<CR>:pwd<CR>
" Mapping <C-q> to force quit
map <leader>q :q!<CR>
" Mapping <C-w> to save and quit
map <leader>w :wq<CR>
" Mapping <C-v> to vertical split
map <leader>v :vsp<CR>
" Mapping <C-h> to horizontal split
map <leader>h :sp<CR>
" Move to beginning/end of line
nnoremap B ^
nnoremap E $
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" => Helper function "
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
            return 'PASTE MODE  '
                en
                    return ''
                    endfunction
