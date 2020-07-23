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

" UI
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'mgee/lightline-bufferline'
NeoBundle 'preservim/nerdtree'
NeoBundle 'kassio/neoterm'

" file types
NeoBundle 'LukeGoodsell/nextflow-vim'
NeoBundle 'danlooo/bioSyntax-vim'
NeoBundle 'fidian/hexmode'

" Misc
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'tmhedberg/SimpylFold'
NeoBundle 'ryanoasis/vim-devicons'
NeoBundle 'tpope/vim-fugitive'

" Syntax
NeoBundle 'tpope/vim-commentary'

" Coloring
NeoBundle 'rakr/vim-one'
NeoBundle 'ap/vim-css-color'
NeoBundle 'overcache/NeoSolarized'
NeoBundle 'sonph/onehalf', {'rtp': 'vim/'}
NeoBundle 'jeffkreeftmeijer/vim-dim'
NeoBundle 'ayu-theme/ayu-vim'

" Frameworks
NeoBundle 'roxma/nvim-yarp'
NeoBundle 'roxma/vim-hug-neovim-rpc'
NeoBundle 'dense-analysis/ale'

" Auto completion
NeoBundle 'ncm2/ncm2'
NeoBundle 'ncm2/ncm2-path'
NeoBundle 'ncm2/ncm2-bufword'
NeoBundle 'ncm2/ncm2-syntax'
NeoBundle 'jalvesaq/Nvim-R'
NeoBundle 'gaalcaras/ncm-R'
NeoBundle 'ncm2/ncm2-jedi'
NeoBundle 'jalvesaq/Nvim-R'
NeoBundle 'Shougo/neco-syntax'

NeoBundle 'junegunn/fzf', { 'do': { -> fzf#install() } }
NeoBundle 'junegunn/fzf.vim'
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" color scheme
colorscheme NeoSolarized
set background=light
"hi Comment guifg=#abb2bf


" Lightline
set noshowmode
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'colorscheme' : 'solarized',
      \ 'tabline': {
      \   'left': [['buffers']],
      \   'right': [[ 'exit' ]],
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ }
let g:lightline#bufferline#shorten_path = 1
let lightline#colorscheme#background = 'light'

function! ToggleDarkModeOne()
  let &background = ( &background == "dark"? "light" : "dark" )
  if exists("g:lightline")
	" BUG: This removes bad spell color coding
    runtime autoload/lightline/colorscheme/one.vim
    call lightline#colorscheme()
  endif
endfunction

" Neoterm
let g:neoterm_default_mod='vertical'

" Disable spell check in terminal for proper color codings
au TermOpen * setlocal nospell

" NERDtree
" start NERDtree if no file was specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
highlight Directory guifg=#bbbbbb ctermfg=grey
let NERDTreeQuitOnOpen=1

" Code folding
set foldmethod=marker
set foldmarker={,}

" Syntax highlighting
if (has("termguicolors"))
  set termguicolors
endif
set number relativenumber
set colorcolumn=80
if !has('nvim')
    set cursorline
endif

highlight LineNR cterm=none ctermfg=Grey ctermbg=none
highlight CursorLineNR cterm=bold ctermfg=White ctermbg=none
highlight SpellBad cterm=underline ctermfg=Red guifg=#e06c75 ctermbg=None
highlight Folded ctermbg=None ctermfg=Grey
highlight Pmenu ctermbg=Grey

let g:ale_sign_error = '⭘'
let g:ale_sign_warning = '⭘'

let g:hexmode_patterns = '*.bin,*.exe,*.o'

set tabstop=4
set shiftwidth=4

set encoding=UTF-8
set hlsearch

set mouse=a
" use X11 primary clipboard in neovim
vnoremap <LeftRelease> "*ygv

" spell check
set spell
set spelllang=en_us,en_medical,de,de_medical,de_nds
autocmd FileType fastq,fasta,sam,gtf setlocal nospell

autocmd BufNewFile,BufRead *snake* set syntax=snakemake

"auto completion
" set dictionary+=/usr/share/dict/ngerman
"set complete+=k

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" set completeopt to be what ncm2 expects
set completeopt=noinsert,menuone,noselect

let R_start_libs = 'base,stats,graphics,grDevices,utils,methods,tidyverse'

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

" R
let R_assign = 0
let R_nvim_wd = 1
let rout_follow_colorscheme = 1

" Linting and fixing
let g:ale_fixers = {
	\ 'markdown': ['remove_trailing_lines', 'trim_whitespace'],
	\ 'python': ['black', 'isort', 'trim_whitespace', 'remove_trailing_lines'],
	\ 'r': ['styler', 'trim_whitespace', 'remove_trailing_lines']
	\}
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1

function! SelectIndent ()
  let temp_var=indent(line("."))
  while indent(line(".")-1) >= temp_var
    exe "normal k"
  endwhile
  exe "normal V"
  while indent(line(".")+1) >= temp_var
    exe "normal j"
  endwhile
endfun

" Keyboard shortcuts
map <Space> <Leader>
map <Leader>n :NERDTreeToggle<CR>
map <Leader>+ :tabnew<CR>:NERDTree<CR>
map <Leader># :new<CR>
map <Leader>- :tabclose<CR>
map <Leader><ENTER> zi " toggle all folds
map <ENTER> za " toggle current fold
map <Leader>dm :call ToggleDarkModeOne()<CR>
map <Leader>c :nohlsearch<CR>
map <Leader>t :TREPLSendSelection<CR>
map <Leader>si :call SelectIndent()<CR>
tnoremap <Esc> <C-\><C-n>

"switch windows
nmap <silent> <Leader><Up> :wincmd k<CR>
nmap <silent> <Leader><Down> :wincmd j<CR>
nmap <silent> <Leader><Left> :wincmd h<CR>
nmap <silent> <leader><Right> :wincmd l<CR>

let g:ale_linters = {
\   'markdown': ['my-languagetool', 'echo-test'],
\} 


 call ale#linter#Define('markdown', {
 \   'name': 'echo-test',
 \   'executable': 'echo',
 \   'command': 'echo hello world',
 \   'callback': {buffer, lines -> map(lines, '{"text": v:val, "lnum": 1}')},
 \})

" BUG: vim ale does not find languagetool command line.
" WORKARROUND: redefine
 call ale#linter#Define('markdown', {
 \   'name': 'my-languagetool',
 \   'executable': 'bash',
 \   'command': 'java -jar ~/opt/LanguageTool/languagetool-commandline.jar --autoDetect  /dev/stdin',
 \   'callback': 'ale#handlers#languagetool#HandleOutput',
 \})
