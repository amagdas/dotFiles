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
set ch=2 " make command line 2 lines high
set ls=2 " always show status line
set guifont=Inconsolata:h15
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P " fancy status line
filetype plugin on
set pastetoggle=<F5>
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

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

autocmd vimenter * if !argc() | NERDTree | endif
nmap <silent> <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds
cabbr <expr> %% expand('%:p:h')   
set path==**         " gf rulez

"JAVA settings
"set efm=\ %#[javac]\ %#%f:%l:%c:%*\\d:%*\\d:\ %t%[%^:]%#:%m,\%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
"set makeprg=ant\ debug\ install\ &&\ adb\ shell\ 'am\ start\ -n\ com.kno.textbooks/.splash.SplashActivity'
"set makeprg=ant\ debug-compile
" =========== Gvim Settings =============

" Removing scrollbars
"if has("gui_running")
"    set guitablabel=%-0.12t%M
"    set guioptions-=T
"    set guioptions-=r
"    set guioptions-=L
"    set guioptions+=a
"    set guioptions-=m
"    set listchars=tab:▸\ ,eol:¬         " Invisibles using the Textmate style
"else
"    set t_Co=256
"endif

" Special Settings for Consoles
if !has("gui_running")
    set t_Co=256
    colorschem nucolors
endif
" Source the vimrc file after saving it
autocmd bufwritepost .vimrc source ~/.vimrc

" ========== END Gvim Settings ==========

