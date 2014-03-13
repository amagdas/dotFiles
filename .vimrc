set nocompatible
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
set wildmenu
set wildmode=list:longest
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
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-k> <c-w>h
map <c-l> <c-w>l
map <leader>g :GundoToggle<CR>
set ch=2 " make command line 2 lines high
set ls=2 " always show status line

"Set font correctly in linux/mac/win
if has("gui_running")
    if has("gui_gtk2")
        set guifont=Source\ Code\ Pro\ 12
    elseif has("gui_macvim")
        set guifont=Source\ Code\ Pro:h13
    elseif has("gui_win32")
        set guifont=Source\ Code\ Pro:h13
    endif
endif

filetype plugin on
set pastetoggle=<F5>
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
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

syntax enable
syntax on
colors nucolors

set backspace=indent,eol,start
au BufRead,BufNewFile *.fs set filetype=fs
au BufRead,BufNewFile *.fsx set filetype=fs

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

map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

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
EOF

"end python changes

"nerd-tree
autocmd vimenter * if !argc() | NERDTree | endif
nmap <silent> <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"vim-obsess settings
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

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
    colorschem nucolors
endif

" Source the vimrc file after saving it
autocmd bufwritepost .vimrc source ~/.vimrc

" ========== END Gvim Settings ==========

"Getting tired of swap files
set nobackup
set nowritebackup
set noswapfile
