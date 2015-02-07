set nocompatible

filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'bling/vim-airline'
Plugin 'elixir-lang/vim-elixir'
Plugin 'ervandew/supertab'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'godlygeek/csapprox'
Plugin 'gregsexton/gitv'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'kien/ctrlp.vim'
Plugin 'klen/python-mode'
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'reinh/vim-makegreen'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-jdaddy'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'esneider/YUNOcommit.vim'
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'

call vundle#end()            " required
filetype plugin indent on    " required

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"


" Override go-to.definition key shortcut to Ctrl-]
let mapleader = "\<Space>"
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_options_max_line_length = 119
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

"Buffer stuff -------------------------{{{
"Switch between buffers using th and tj
nnoremap tk  :bnext<CR>
nnoremap tj  :bprev<CR>
"Go to first and last buffers with th and tl
nnoremap th  :bfirst<CR>
nnoremap tl  :blast<CR>
"New buffer with tn
nnoremap tn  :new<Space>
"Close a tab with td
nnoremap td  :bdelete<CR>
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

filetype plugin on
set pastetoggle=<F5>
nmap <leader>a <Esc>:Ack!

"Status line
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P " fancy status line
"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
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
au BufRead,BufNewFile *.fs set filetype=fs
au BufRead,BufNewFile *.fsx set filetype=fs

"Html
autocmd FileType html,xhtml set omnifunc=htmlcomplete#CompleteTags 
au FileType css set ofu=csscomplete#CompleteCSS

" C# settings
"au FileType cs set omnifunc=syntaxcomplete#Complete 
"au FileType cs set foldmethod=marker 
"au FileType cs set foldmarker={,} 
"au FileType cs set foldtext=substitute(getline(v:foldstart),'{.*','{...}',) 
"au FileType cs set foldlevelstart=2 
" Quickfix mode: command line msbuild error format 
"au FileType cs set errorformat=\ %#%f(%l\\\,%c):\ error\ CS%n:\ %m
":set errorformat=\ %#%f(%l\\\,%c):\ %m
":set makeprg=msbuild\ /nologo\ /property:GenerateFullPaths=true

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
map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

"behave integration
map <leader>bb :set makeprg=behave\ %\|:call MakeGreen()<CR>

"end python changes

"nerd-tree
autocmd vimenter * if !argc() | NERDTree | endif
nmap <silent> <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Check if NERDTree is open or active
function! s:isNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction
 
" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! s:syncTree()
    if &modifiable && s:isNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
        NERDTreeFind
        wincmd p
    endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd bufenter * call s:syncTree()


"vim-obsess settings
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

" Tagbar key bindings."
nmap <leader>l <ESC>:TagbarToggle<cr>
imap <leader>l <ESC>:TagbarToggle<cr>i

" Mini Buffer some settings."
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

"expand %% to curent full path
cabbr <expr> %% expand('%:p:h')   
set path==**         " gf rulez

"JAVA settings
"set efm=\ %#[javac]\ %#%f:%l:%c:%*\\d:%*\\d:\ %t%[%^:]%#:%m,\%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
"set makeprg=ant\ debug\ install\ &&\ adb\ shell\ 'am\ start\ -n\ com.kno.textbooks/.splash.SplashActivity'
"set makeprg=ant\ debug-compile

" =========== Gvim Settings =============
" Removing scrollbars
if has("gui_running")
    colors railscasts-alt
    set guitablabel=%-0.12t%M
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions+=a
    set guioptions-=m
    set listchars=tab:▸\ ,eol:¬         " Invisibles using the Textmate style
else
    set t_Co=256
    colorscheme railscasts-alt
endif

" Source the vimrc file after saving it
autocmd bufwritepost .vimrc source ~/.vimrc
" disable visual bell
set noeb vb t_vb=
au GUIEnter * set vb t_vb=
" ========== END Gvim Settings ==========
"Getting tired of swap files
"set nobackup
"set nowritebackup
"set noswapfile
