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
NeoBundle 'danlooo/bioSyntax-vim'
NeoBundle 'fidian/hexmode'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'sbdchd/neoformat'
NeoBundle 'tmhedberg/SimpylFold'
NeoBundle 'ryanoasis/vim-devicons'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ap/vim-css-color'
NeoBundle 'tpope/vim-commentary'
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

colorscheme onedark

" NERDtree
" start NERDtree if no file was specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
highlight Directory guifg=#bbbbbb ctermfg=grey

" Code folding
nnoremap <ENTER> za
set foldmethod=marker
set foldmarker={,}

" Syntax highlighting
"BUG: does not work
set number relativenumber
set colorcolumn=0
if !has('nvim')
    set cursorline
endif

highlight LineNR cterm=none ctermfg=Grey ctermbg=none
highlight CursorLineNR cterm=bold ctermfg=White ctermbg=none
highlight SpellBad cterm=underline ctermfg=Red ctermbg=None
highlight Folded ctermbg=None ctermfg=Grey
highlight Pmenu ctermbg=Grey

let g:hexmode_patterns = '*.bin,*.exe,*.o'

set tabstop=4
set shiftwidth=4

set encoding=UTF-8
set mouse=a
set hlsearch

" spell check
set spell
set spelllang=en_us,en_medical,de,de_medical,de_nds
autocmd FileType fastq,fasta,sam setlocal nospell

autocmd BufNewFile,BufRead *snake* set syntax=snakemake

"auto completion
set dictionary+=/usr/share/dict/ngerman
set complete+=k

"Tab: Indent if we're at the beginning of a line. Else, do completion
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

if (has("termguicolors"))
  set termguicolors
endif

