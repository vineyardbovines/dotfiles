" use vim not vi
set nocompatible
filetype off

" init vim-plug
call plug#begin('~/.vim/plugged')

" plugins
Plug 'junegunn/fzf', { 'do': 'yes n \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-emoji'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Goyo' }
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-signify'
Plug 'dense-analysis/ale'
Plug 'rstacruz/vim-closer'
Plug 'Yggdroot/indentLine'
Plug 'voldikss/vim-floaterm'
Plug 'leafgarland/typescript-vim'
Plug 'ayu-theme/ayu-vim'

" finish plugins
call plug#end()

" general settings
filetype plugin indent on
set autoindent
set backspace=indent,eol,start
set clipboard^=unnamed
set completeopt=noinsert,menuone,noselect
set copyindent
set cursorline
set encoding=utf-8 nobomb
set expandtab shiftwidth=2 softtabstop=-1
set hidden
set history=1000
set incsearch hlsearch ignorecase smartcase
set lazyredraw
set linebreak
set list listchars=tab:.\ ,trail:.
set matchpairs+=<:>
set nobackup
set noswapfile
set nu
set scrolloff=5
set shortmess+=cW
set showmatch
set splitright
set tags=./tags;,tags
set ttimeoutlen=0
set undofile
set undodir=~/.vim/undo
set visualbell
set wildignore+=tags,*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem,*.pyc,*.swp,*~,*/.DS_Store
set wildmode=longest:full,list,full

if !exists("g:syntax_on")
  syntax enable
endif

set t_Co=256
syntax on

set termguicolors
let ayucolor="mirage"
colorscheme ayu

hi Normal guibg=NONE ctermbg=NONE

" lightline
let g:lightline = {
  \ 'colorscheme': 'one',
  \ }

" IndentLine {{
let g:indentLine_char = '|'
let g:indentLine_first_char = '|'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" NERD Tree {{
" Show hidden files/directories
let g:NERDTreeShowHidden = 1
" Remove bookmarks and help text from NERDTree
let g:NERDTreeMinimalUI = 1
" Hide the Nerdtree status line to avoid clutter
" let g:NERDTreeStatusline = ''
" Hide certain files and directories from NERDTree
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]']
" Mappings
nnoremap <leader>n :NERDTreeToggle<cr>
" map <C-n> :NERDTreeToggle<CR>
" nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
" }}

" map nerdtree
map <C-a> :NERDTreeToggle<CR>

" ale
let b:ale_fixers = {'javascript': ['prettier', 'eslint'] }
