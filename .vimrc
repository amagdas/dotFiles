set nocompatible

filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'

" Async syntax checking
Plugin 'w0rp/ale'

" Elixir
Plugin 'elixir-lang/vim-elixir'
Plugin 'slashmili/alchemist.vim'
Plugin 'BjRo/vim-extest'
Plugin 'mhinz/vim-mix-format'
Plugin 'mmorearty/elixir-ctags'
" End for elixir plugins
"
Plugin 'Shougo/deoplete.nvim'

Plugin 'elmcast/elm-vim'

Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

Plugin 'ervandew/supertab'
"Plugin 'godlygeek/csapprox'
Plugin 'gregsexton/gitv'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mileszs/ack.vim'

Plugin 'plasticboy/vim-markdown'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
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
"Plugin 'mtscout6/vim-cjsx'
"Plugin 'digitaltoad/vim-jade'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Themes
Plugin 'joshdick/onedark.vim'
"Plugin 'challenger-deep-theme/vim', { 'name': 'challenger_deep'  }
Plugin 'crusoexia/vim-monokai'
"Plugin 'w0ng/vim-hybrid'

call vundle#end()            " required
filetype plugin indent on    " required

let mapleader = ","

let g:jsx_ext_required = 0

let g:ackprg = 'ag --nogroup --nocolor --column'

set ruler
set ttyfast
set modelines=0
set tabstop=2
set shiftwidth=2
set softtabstop=2
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
set textwidth=180
set formatoptions=qrn1

" Dictionary path, from which the words are being looked up.
set dictionary=/usr/share/dict/cracklib-small

" MAPPINGS
"
" Get Rid of stupid Goddamned help keys
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Clear last search highlighting
nnoremap <Space> :noh<cr>

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

nnoremap <leader>c "+y
nnoremap <leader>p "+p
vnoremap <leader>c "+y
vnoremap <leader>p "+p

" ----------------------------------------------------------------------------
" vim-fugitive
" ----------------------------------------------------------------------------
nmap     <leader>g :Gstatus<CR>gg<c-n>
nnoremap <leader>d :Gdiff<CR>

" FZF
let g:fzf_layout = { 'down': '~50%' }
nnoremap <leader>t :FZF<CR>
nnoremap <leader><Space> :Buffers<CR>
vnoremap <leader><Space> :Buffers<CR>

"nnoremap <leader>html :-1read $HOME/.vim/snippets/.skeleton.html<CR>3jwf>a

" De-fuckify syntax hilighting
"nnoremap <F3> :syn sync fromstart<CR>
set pastetoggle=<leader>x

" Editing vimrc
nmap <leader>v :source $MYVIMRC<CR>
nmap <leader>e :edit $MYVIMRC<CR>


"Buffer stuff -------------------------{{{
"Switch between buffers using ,,
nnoremap <leader>,  :b#<CR>

"New buffer with new
nnoremap <leader>n  :new<Space>

"Close a tab with bd
"nnoremap <leader>bd  :bdelete<CR>
"}}}

nmap <leader>ag <Esc>:Ack!

"nerd-tree
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>


"Save quicker with <leader>w - saves all buffers
nnoremap <leader>s :wa<CR>
"Switch between windows in the same tab -------------------------{{{
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <C-k> <C-w>k
"}}}

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-k> <c-w>h
map <c-l> <c-w>l
"set ls=2 " always show status line

filetype plugin on

" ELM
let g:elm_format_autosave = 1
let g:elm_setup_keybindings = 0
au FileType elm nnoremap <leader>. :ElmShowDocs<CR>
au FileType elm nnoremap <leader>.. :ElmMake<CR>

" Elixir
let g:mix_format_on_save = 0

" ALE
let g:elm_setup_keybindings = 0
let g:ale_fix_on_save = 1

let g:ale_javascript_eslint_executable = 'node_modules/eslint/bin/eslint.js'
let g:ale_javascript_prettier_options = '--print-width 160 --single-quote --trailing-comma all --bracket-spacing --jsx-bracket-same-line'
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['elixir'] = ['mix_format']
"au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'elm': ['make'],
\   'elixir': ['credo'],
\}
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#error_symbol = ' ⨉ '
let g:airline#extensions#ale#warning_symbol = ' ⚠ '
let g:airline_theme='onedark'

set background=dark
syntax enable
syntax on

"Folding
set foldlevelstart=20
set foldlevel=20
set foldmethod=syntax

set backspace=indent,eol,start

"Html
"autocmd FileType html,xhtml set omnifunc=htmlcomplete#CompleteTags
"au FileType css set ofu=csscomplete#CompleteCSS

"vim-obsess settings
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

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

    set guifont=Fira\ Code\ Retina\ 18
    if has("gui_gtk2")
        set guifont=Fira\ Code\ Retina\ 13
    elseif has("gui_macvim")
        set macligatures
        set guifont=Fira\ Code\ Retina:h18
    elseif has("gui_win32")
        set guifont=Source\ Code\ Pro:h13
    endif
else
    set t_Co=256
    set t_ut=
    set termguicolors
    colorscheme onedark
    "colorscheme challenger_deep
    "colorscheme monokai
endif


" Source the vimrc file after saving it
"autocmd bufwritepost .vimrc source ~/.vimrc


" disable visual bell
set noeb vb t_vb=
au GUIEnter * set vb t_vb=
" ========== END Gvim Settings ==========
"
"Getting tired of swap files
set nobackup
set nowritebackup
set noswapfile
set synmaxcol=300

function! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

autocmd BufWritePre * :call StripTrailingWhitespaces()
