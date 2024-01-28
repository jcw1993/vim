let mapleader = ","
let g:mapleader = ","
let g:solarized_termcolors=256
let g:tagbar_autofocus=1
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$', '\.class$']
let g:NERDSpaceDelims=1
let g:NERDDefaultAlign = 'left'
let g:rainbow_active = 1

set nocompatible
set splitright
set splitbelow
filetype on
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'scrooloose/nerdtree'
Plugin 'easymotion/vim-easymotion'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ghifarit53/tokyonight-vim'
Plugin 'raimondi/delimitmate'
Plugin 'frazrepo/vim-rainbow'
Plugin 'majutsushi/tagbar'
Plugin 'itchyny/lightline.vim'
Plugin 'w0rp/ale'
Plugin 'scrooloose/nerdcommenter'
Plugin 'valloric/youcompleteme'
call vundle#end()

nnoremap <c-p> :Files<CR>
nnoremap <c-g> :Rg<CR>

inoremap jk <ESC>
inoremap jK <ESC>
inoremap JK <ESC>
inoremap <c-j> <c-n>
inoremap <c-k> <c-p>
nnoremap <space> za
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>

map <c-n> :NERDTreeToggle<cr>
map <leader>f :NERDTreeFind<cr>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l
map <s-left> :vertical resize -2<CR>
map <s-right> :vertical resize +2<CR>
map <s-up> :resize -2<CR>
map <s-down> :resize +2<CR>

let g:easymotion_do_mapping = 0 " disable default mappings
nmap s <Plug>(easymotion-s2)
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

nmap <Leader>t :TagbarToggle<CR>

map <leader>tj :tabnext<cr>
map <leader>tk :tabprev<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>

noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

map <leader>v :vsplit<cr>

" set clipboard=unnamed

let g:last_active_tab = 1
nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
autocmd TabLeave * let g:last_active_tab = tabpagenr()
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <Esc>:tabnew<CR>

filetype plugin indent on

let python_highlight_all=1
syntax on
set ffs=unix,mac,dos
set number
set history=500
set autoread 

set so=7

set wildmenu
set wildignore=*.o*,*~,*.pyc,*.png,*.jpg,*.jpeg,*.gif,*.class,*.swp,*.zip,*.so

set ruler
set cmdheight=2
set hid

set backspace=eol,start,indent
set whichwrap+=<,>,h,l
 
set ignorecase
set smartcase

set hlsearch
set incsearch

set lazyredraw

set magic

set showmatch

set mat=2

set noerrorbells
set novisualbell
set tm=500

set foldcolumn=1
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

syntax enable

try 
	colorscheme desert
catch 
endtry

set background=dark
" colorscheme solarized

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

set nobackup
set nowb 
set noswapfile

set expandtab
set smarttab

set shiftwidth=4
set tabstop=4
set softtabstop=4
set lbr
set tw=500

set ai
set si 
set wrap

set completeopt=longest,menu

set laststatus=2
let g:lightline = { 'colorscheme': 'powerline' }

let g:rainbow_active = 1
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

let g:ycm_global_ycm_extra_conf='~/.vim/bundle/youcompleteme/third_party/ycmd/.ycm_extra_conf.py'

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


