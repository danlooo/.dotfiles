" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'LukeGoodsell/nextflow-vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'preservim/nerdtree'
NeoBundle 'sonph/onehalf'
NeoBundle 'joshdick/onedark.vim'
NeoBundle 'bioSyntax/bioSyntax-vim'
NeoBundle 'fidian/hexmode'
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Lightline
set noshowmode
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

" NERDtree
" start NERDtree if no file was specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Syntax highlighting
"BUG: does not work
set number
set colorcolumn=0
if !has('nvim')
    set cursorline
endif

let g:hexmode_patterns = '*.bin,*.exe,*.o'

highlight LineNR cterm=none ctermfg=Grey ctermbg=none
highlight CursorLineNR cterm=bold ctermfg=White ctermbg=none
highlight SpellBad cterm=underline ctermfg=Red ctermbg=None

set tabstop=4
set shiftwidth=4

set spell
set spelllang=en_us,en_medical,de,de_medical,de_nds

au BufNewFile,BufRead *snake* set syntax=snakemake
