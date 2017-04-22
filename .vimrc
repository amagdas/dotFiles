set nocompatible

filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'

" Elixir
Plugin 'elixir-lang/vim-elixir'
Plugin 'BjRo/vim-extest'
Plugin 'mattreduce/vim-mix'
Plugin 'mmorearty/elixir-ctags'
" End for elixir plugins
"
" Python
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'klen/python-mode'

Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'ervandew/supertab'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'godlygeek/csapprox'
Plugin 'gregsexton/gitv'
Plugin 'jiangmiao/auto-pairs'
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'reinh/vim-makegreen'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'mtscout6/syntastic-local-eslint.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-jdaddy'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'esneider/YUNOcommit.vim'
Plugin 'vim-scripts/camelcasemotion'

" JSX
Plugin 'mtscout6/vim-cjsx'
Plugin 'digitaltoad/vim-jade'

Plugin 'joshdick/onedark.vim'

call vundle#end()            " required
filetype plugin indent on    " required

let mapleader = ","

let g:ackprg = 'ag --nogroup --nocolor --column'

set ruler
set ttyfast
set modelines=0
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set hidden

" Wildmenu completion "
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn " Version Controls"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
set wildignore+=*.spl "Compiled speolling world list"
set wildignore+=*.sw? "Vim swap files"
set wildignore+=*.DS_Store "OSX SHIT"
set wildignore+=*.luac "Lua byte code"
set wildignore+=migrations "Django migrations"
set wildignore+=*.pyc "Python Object codes"
set wildignore+=*.orig "Merge resolution files"

set lines=999
set columns=999
set number
set incsearch
set autoindent
set vb t_vb= "
set showmatch
set hlsearch
set novisualbell
set ignorecase
set smartcase

" Make Vim to handle long lines nicely.
set wrap
set textwidth=119
set formatoptions=qrn1

" Dictionary path, from which the words are being looked up.
set dictionary=/usr/share/dict/cracklib-small

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'node_modules/eslint/bin/eslint.js'

" Get Rid of stupid Goddamned help keys
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Naviagations using keys up/down/left/right
" Disabling default keys to learn the hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" FZF
nnoremap <leader>t :FZF<CR>

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~50%' }


"Buffer stuff -------------------------{{{
"Switch between buffers using ,,
nnoremap <leader>,  :bprev<CR>

"New buffer with tn
nnoremap <leader>new  :new<Space>

"Close a tab with td
nnoremap <leader>bd  :bdelete<CR>
"}}}

"Save quicker with <leader>w - saves all buffers
nnoremap <leader>w :wa<CR>
"Switch between windows in the same tab -------------------------{{{
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <C-k> <C-w>k
"}}}
"make ctrl backspace delete the entire word when in insert mode
inoremap <C-BS> <C-W>

"make 'kj' do the equivalent of escape
:inoremap kj <Esc>
:cnoremap kj <Esc>

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-k> <c-w>h
map <c-l> <c-w>l
set ls=2 " always show status line

"Set font correctly in linux/mac/win
if has("gui_running")
    set guifont=Source\ Code\ Pro\ 11
    if has("gui_gtk2")
        set guifont=Source\ Code\ Pro\ 10
    elseif has("gui_macvim")
        set guifont=Source\ Code\ Pro:h13
    elseif has("gui_win32")
        set guifont=Source\ Code\ Pro:h13
    endif
endif

if (has("termguicolors"))
    set termguicolors
endif

filetype plugin on
set pastetoggle=<F5>
nmap <leader>a <Esc>:Ack!

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Status line
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P " fancy status line
"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*
set statusline+=%{fugitive#statusline()}
set statusline+=%h      "help file flag
set statusline+=%y      "filetype
set statusline+=%r      "read only flag
set statusline+=%m      "modified flag

set background=dark
syntax enable
syntax on

"Folding
set foldlevelstart=20
set foldlevel=20
set foldmethod=syntax

set backspace=indent,eol,start

"Html
autocmd FileType html,xhtml set omnifunc=htmlcomplete#CompleteTags
au FileType css set ofu=csscomplete#CompleteCSS

"Python
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType="context"
set completeopt=menuone,longest,preview

" Execute the tests
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>

" cycle through test errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

"nose integration
"map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

"behave integration
"map <leader>bb :set makeprg=behave\ %\|:call MakeGreen()<CR>

"end python changes

"nerd-tree
nmap <leader>n :NERDTreeToggle<CR>

"vim-obsess settings
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

nnoremap <leader>x :

" Mini Buffer some settings."
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

"expand %% to curent full path
cabbr <expr> %% expand('%:p:h')
set path==**         " gf rulez

" =========== Gvim Settings =============
" Removing scrollbars
if has("gui_running")
    colors onedark
    set guitablabel=%-0.12t%M
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions+=a
    set guioptions-=m
    set listchars=tab:▸\ ,eol:¬         " Invisibles using the Textmate style
else
    set t_Co=256
    colorscheme onedark
endif

let g:airline_theme='onedark'

" Source the vimrc file after saving it
autocmd bufwritepost .vimrc source ~/.vimrc
" disable visual bell
set noeb vb t_vb=
au GUIEnter * set vb t_vb=
" ========== END Gvim Settings ==========
"
"Getting tired of swap files
set nobackup
set nowritebackup
set noswapfile
