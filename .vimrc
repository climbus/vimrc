" Thomas Jansson 2016

"""""""""""""""""""""""""""""""""""
" VIM PLUG SETUP and some downloads
" http://vimawesome.com/
"""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'scrooloose/syntastic'
Plug 'nvie/vim-flake8'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'jacoborus/tender'
Plug 'ervandew/supertab'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-signify'
call plug#end()

""""""""""""""""""""""""
" Setup plugins settings
""""""""""""""""""""""""
syntax enable
syntax on
let python_highlight_all=1

let g:rehash256 = 1
" let g:solarized_termcolors=256
" set t_Co=256
set background=dark
colorscheme luna

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

noremap <C-x> :CtrlP ~/QI<CR>
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" Only tabularize the first = 
map <S-F5> :Tabularize /^[^=]*\zs=<cr>
" Align all the , in alist of dicts or tupples 
map <S-F6> :Tabularize /,\zs<cr>
" Tabularize elements of a dict
map <S-F7> :Tabularize /:\zs<cr>

set tabpagemax=50
map <F8> :tabp<cr>
map <F9> :tabn<cr>

" NERDtree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:python_version_2 = 1

" Syntastic
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "type": "style" }

""""""""""""""""""""
" My hacks
""""""""""""""""""""
" Remove trailing spaces
nnoremap <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Save and run the current script
nmap <F5> :w<CR> :! ./%<CR>

highlight Search term=standout ctermfg=3 cterm=standout
highlight Visual term=standout ctermfg=4 cterm=standout
set hlsearch
set backspace+=start,eol,indent
set backupdir=./.backup,.,/tmp
set directory=.,./.backup,/tmp
set expandtab
set ignorecase
set noerrorbells
set novisualbell
set nowrap
set shiftwidth=4
set showmatch
set smartcase
set smarttab
set softtabstop=4
set tabstop=4
set textwidth=0
set virtualedit=all
set wildignore=*.swp,*.bak,*.pyc,*.class
set ttyfast

command! Q  quit
command! W  write
command! Wq wq

""""""""""""""""""
"" Filetypes
""""""""""""""""""
filetype on
filetype plugin on
filetype indent on
filetype plugin indent on
