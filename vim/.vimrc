" after editing file, run
" :so <PATH TO VIMRC>
" to source changes

" syntax highlighting
syntax on

" set dark background
" commented out on systems where Hyper.js is used
" set background=dark

" enable filetype detection
filetype plugin indent on

" show line numbers
set number

" when creating a new line, copy the indentation from the line above
set autoindent

" highlight all pattern matches WHILE typing the pattern
set incsearch
set hlsearch

" show matching brackets
set showmatch

" highlight current line
" set cursorline

" show command
set showcmd

" wild menu
set wildmenu

" allow code folding, set value to 10 so big blocks are auto-folded, 
" set key to fold/unfold to space bar, set to fold in indentions
set foldenable
set foldlevelstart=10
nnoremap <space> za
set foldmethod=indent

" automatic install of vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" begin adding vim plugins
call plug#begin('~/.vim/plugged')

" add vim theme github-dark theme based on VS Code GitHub dark theme
" commented out on systems where Hyper.js is used
" Plug 'wojciechkepka/vim-github-dark'

" use fatih/vim-go for golang syntax highlighting
" the tag is set to * for most recent version,
" other tags can be used for different versions
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'tag': '*'}

" initialize plugin system
call plug#end()

" initialize github dark colorscheme from vim-plug
" commented out on systems where Hyper.js is used
" colorscheme ghdark

" use softer colorscheme for ghdark
" commented out on systems where Hyper.js is used
" let g:gh_color = 'soft'

" disable update of dependencies for vim-go
" default is 1, enabled
" if tag is set in Plug, do not run
" let g:go_get_update=1

" disable warning for incompative version of vim
" default is 1, enabled
" if tag is set in Plug, run command
" let g:go_version_warning=0
