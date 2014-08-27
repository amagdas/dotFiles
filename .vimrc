set nocompatible
let g:pymode_options_max_line_length = 119
let g:ackprg = 'ag --nogroup --nocolor --column'
execute pathogen#infect()
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
set dictionary=/usr/share/dict/words

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

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-k> <c-w>h
map <c-l> <c-w>l
map <leader>g :GundoToggle<CR>
set ls=2 " always show status line

"Set font correctly in linux/mac/win
if has("gui_running")
    colors jellybeans
    set guifont=Source\ Code\ Pro\ 11
    if has("gui_gtk2")
        set guifont=Source\ Code\ Pro\ 11
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

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
sys.path.append(os.getcwd())
EOF

"end python changes

"nerd-tree
autocmd vimenter * if !argc() | NERDTree | endif
nmap <silent> <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

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
    set guitablabel=%-0.12t%M
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions+=a
    set guioptions-=m
    set listchars=tab:▸\ ,eol:¬         " Invisibles using the Textmate style
else
    set t_Co=256
    colorscheme jellybeans
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
