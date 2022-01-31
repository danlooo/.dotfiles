" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
    set nocompatible   " Be iMproved
endif

set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'preservim/nerdtree'
call neobundle#end()
filetype plugin indent on
NeoBundleCheck

set number
set shiftwidth=4
set softtabstop=4
syntax on

" use terminal colors for color scheme
set t_Co=16