let mapleader = ","
let g:mapleader = ","
let g:solarized_termcolors=256
let g:tagbar_autofocus=1
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$', '\.class$']
let g:NERDSpaceDelims=1
let g:NERDDefaultAlign = 'left'

set nocompatible
set splitright
filetype on
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'scrooloose/nerdtree'
Plugin 'easymotion/vim-easymotion'
Plugin 'junegunn/fzf'
Plugin 'altercation/vim-colors-solarized'
Plugin 'raimondi/delimitmate'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mileszs/ack.vim'
Plugin 'w0rp/ale'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdcommenter'
call vundle#end()

nnoremap <silent> <C-p> :FZF<CR>
nnoremap <S-f> :Ack <C-R><C-W> 
cnoreabbrev Ack Ack!

inoremap jk <ESC>
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

let g:easymotion_do_mapping = 0 " disable default mappings
nmap s <Plug>(easymotion-s2)
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:airline#extensions#ale#enabled = 1

" tab
nmap <Leader>t :TagbarToggle<CR>
map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tj :tabnext<cr>
map <leader>tk :tabprev<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>
map <leader>te :tabedit<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabm<cr>

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
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>

filetype plugin indent on
runtime macros/matchit.vim

let python_highlight_all=1
syntax on
set ffs=mac,dos,unix
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
colorscheme solarized

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

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{ALEGetStatusLine()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

if executable('ag')
    let g:ackprg = 'ag --vimgrep --smart-case'
endif

" auto add python header
autocmd BufNewFile *.py 0r ~/.vim/vim_template/vim_python_header
autocmd BufNewFile *.py ks|call FileName()|'s
autocmd BufNewFile *.py ks|call CreatedTime()|'s

fun FileName()
    let l = line("$")
    if l > 10
        let l = 10
    endif
    exe "1, " . l . "g/File Name:.*/s/File Name:.*/File Name: " .expand("%")
endfun

fun CreatedTime()
    let l = line("$")
    if l > 10
        let l = 10
    endif
    exe "1, " . l . "g/Created Time:.*/s/Created Time:.*/Created Time: " .strftime("%Y-%m-%d %T")
endfun
