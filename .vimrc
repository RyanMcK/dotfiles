set nocompatible

" Begin general settings.
syntax on
set showmatch
set ignorecase
set ruler
set mouse=a
set mousehide
scriptencoding utf-8
set history=1000
set spell
set hidden
" End general settings.

" Begin Vundle install.
filetype on
filetype off
let install_vundle=1
let readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(readme)
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let install_vundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Custom bundles.
" Solarized colorscheme.
Bundle 'altercation/vim-colors-solarized'
" NERDTree filesystem explorer.
Bundle 'scrooloose/nerdtree'
" Insert closing braces.
Bundle 'spf13/vim-autoclose'
" Class outline viewer.  Requires exuberant ctags.
if executable('ctags')
    Bundle 'majutsushi/tagbar'
endif
" NERDTree tabs control.
Bundle 'jistr/vim-nerdtree-tabs'
" Syntax checking.
Bundle 'scrooloose/syntastic'
" Autocompletion.  Requires python support, libclang, and a compilation step.
Bundle 'Valloric/YouCompleteMe'

if install_vundle == 0
    :BundleInstall
endif
" End Vundle install.

filetype off
filetype on

" Begin user interface.
set background=dark
" Solarized options.
" Assumes terminal is set to Solarized colorscheme, too.
let g:solarized_termcolors = 16
let g:solarized_visibility = "normal"
let g:solarized_contrast = "normal"
colorscheme solarized

set tabpagemax=15
set showmode

if has('statusline')
    set laststatus=2
    set statusline=%<%f\ " File name.
    set statusline+=%w%h%m%r " Options.
    set statusline+=\ [%{&ff}/%Y] " File type.
    set statusline+=\ [%{getcwd()}] " Current directory.
    set statusline+=%=%-14.(%l,%c%V%)\ %p%% " File navigation.
endif

set backspace=indent,eol,start
set linespace=0
set number
set showmatch
set incsearch
set hlsearch
set winminheight=0
set ignorecase
set smartcase
set wildmenu
set wildmode=list:longest,full
set whichwrap=b,s,h,l,<,>,[,]
set scrolljump=5
set scrolloff=3
set foldenable
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
" End user interface.

" Begin formatting.
set nowrap
set autoindent
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4
set colorcolumn=80
set pastetoggle=<F12>
set formatoptions+=r
" Remove trailing whitespace.
autocmd FileType c,cpp,java,go,php,javascript,python,tex,twig,xml,yml
    \ autocmd BufWritePre <buffer> call StripTrailingWhitespace()
autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
" End formatting.

" Begin key mappings.
let mapleader=','
" End key mappings.

" Begin plugin settings.
map <C-f> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>
map <C-e> :NERDTreeTabsToggle<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg',
                    \ '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1

nmap <C-d> :TagbarToggle<CR>

let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -Wall -Wextra -pedantic -std=c++11'
let g:syntastic_cpp_include_dirs = ['/usr/include', '/usr/local/include',
                                    \ '/opt/local/include']
let g:syntastic_cpp_check_header = 1

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" End plugin settings.

" Begin strip whitespace function.
function! StripTrailingWhitespace()
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
" End strip whitespace function.

