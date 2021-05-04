if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'jceb/vim-orgmode'

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-dadbod'
Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'
Plug 'bling/vim-airline'
Plug 'w0rp/ale'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-emoji'

Plug 'scrooloose/nerdcommenter'

Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'
Plug 'esneider/YUNOcommit.vim'

" Themes
"Plug 'junegunn/seoul256.vim'
"Plug 'junegunn/goyo.vim'
"Plug 'junegunn/limelight.vim'
"Plug 'lifepillar/vim-solarized8'
"Plug 'morhetz/gruvbox'
"Plug 'joshdick/onedark.vim'
"Plug 'trevordmiller/nova-vim'
"Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline-themes'
Plug 'tiagovla/tokyodark.nvim'

" Elixir
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'mhinz/vim-mix-format', { 'for': 'elixir' }
Plug 'mmorearty/elixir-ctags', { 'for': 'elixir' }
" End for elixir plugins

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Erlang plugins
Plug 'hyhugh/coc-erlang_ls', {'do': 'yarn install --frozen-lockfile', 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-skeletons', { 'for': 'erlang' }
" End for erlang plugins

Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }

Plug 'elmcast/elm-vim', { 'for': 'elm' }

"Ziglang
Plug 'ziglang/zig.vim', { 'for': 'zig' }

"Nix
Plug 'LnL7/vim-nix'

"Haskell
Plug 'prabirshrestha/vim-lsp', { 'for': 'haskell' }
Plug 'prabirshrestha/asyncomplete.vim', { 'for': 'haskell' }
Plug 'prabirshrestha/asyncomplete-lsp.vim', { 'for': 'haskell' }
Plug 'mattn/vim-lsp-settings', { 'for': 'haskell' }

call plug#end()

set termencoding=utf-8
set encoding=utf-8
scriptencoding utf-8
if !has('nvim')
   set term=xterm-256color
endif

let g:tokyodark_transparent_background = 1
let g:tokyodark_enable_italic_comment = 1
let g:tokyodark_enable_italic = 1
let g:tokyodark_color_gamma = "1.0"

if has("gui_running")
    set background=dark
    let g:airline_theme='gruvbox'
    colors gruvbox
    set guitablabel=%-0.12t%M
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions+=a
    set guioptions-=m
    set listchars=tab:▸\ ,eol:¬         " Invisibles using the Textmate style
    set guifont=Fira\ Code\ Retina\ 14
else
  set t_Co=256
  set t_ut=
  set termguicolors
  set background=dark
  "colorscheme solarized8
  let g:airline_theme='gruvbox'
  if has('nvim')
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum
    colorscheme tokyodark
  else
    colorscheme gruvbox
  endif
endif

let mapleader = ","
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
set colorcolumn=90
set showmode
set showcmd
set hidden
set list
set listchars=tab:␉·,trail:␠,nbsp:⎵
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

" MAPPINGS
"
" Get Rid of stupid Goddamned help keys
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Clear last search highlighting
nnoremap <Space> :noh<cr>

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

nnoremap <leader>c :w !xsel -b<CR><CR>
nnoremap <leader>p :r !xsel -o<CR><CR>
vnoremap <leader>c :w !xsel -b<CR><CR>
vnoremap <leader>p :r !xsel -o<CR><CR>

"nnoremap <leader>c "+y
"nnoremap <leader>p "+p
"vnoremap <leader>c "+y
"vnoremap <leader>p "+p

" ----------------------------------------------------------------------------
" vim-fugitive
" ----------------------------------------------------------------------------
nmap     <leader>g :Gstatus<CR>gg<c-n>
nnoremap <leader>d :Gdiff<CR>

" FZF
let g:fzf_layout = { 'down': '~60%' }
nnoremap <leader>t :FZF<CR>
nnoremap <leader><Space> :Buffers<CR>
vnoremap <leader><Space> :Buffers<CR>

"nnoremap <leader>html :-1read $HOME/.vim/snippets/.skeleton.html<CR>3jwf>a

" De-fuckify syntax highlighting
"nnoremap <F3> :syn sync fromstart<CR>
set pastetoggle=<leader>x

" Editing vimrc
nmap <leader>v :vsplit <CR>
nmap <leader>== :vertical resize +5 <CR>
nmap <leader>-- :vertical resize -5 <CR>
nmap <leader>e :edit $MYVIMRC<CR>


"Buffer stuff -------------------------{{{
"Switch between buffers using ,,
nnoremap <leader>,  :b#<CR>

"New buffer with new
nnoremap <leader>n  :new<Space>

"Close a tab with bd
"nnoremap <leader>bd  :bdelete<CR>
"}}}

" Search word under cursor with AG
nmap <leader>ag <Esc>:Ack!

"Dirvish
nnoremap <leader>nn :Dirvish<CR>
nnoremap <leader>nf :Dirvish %<CR>

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

filetype plugin on

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

" ELM
"let g:elm_format_autosave = 1
"let g:elm_setup_keybindings = 0
"au FileType elm nnoremap <leader>. :ElmShowDocs<CR>
"au FileType elm nnoremap <leader>.. :ElmMake<CR>


" Elixir
let g:mix_format_on_save = 1

" ALE
let g:elm_setup_keybindings = 0
let g:jsx_ext_required = 0
let g:ale_fix_on_save = 1
let g:ale_elixir_elixir_ls_release = '/home/crafter/Work/elixir-ls/rel'

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
let g:airline#extensions#ale#error_symbol = ' 🙅 '
let g:airline#extensions#ale#warning_symbol = ' 🙈 '
"let g:airline_theme='nova'

syntax enable
syntax on

"Folding
set foldlevelstart=20
set foldlevel=20
set foldmethod=syntax

set backspace=indent,eol,start

"also erlang
autocmd BufRead,BufNewFile *.erl,*.es.*.hrl,*.xrl,*.config setlocal expandtab noautoindent
au BufNewFile,BufRead *.erl,*.es,*.hrl,*.xrl,*.config setf erlang
"let g:erlang_tags_auto_update = 0

" Haskell-vim
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

"Html
"autocmd FileType html,xhtml set omnifunc=htmlcomplete#CompleteTags
"au FileType css set ofu=csscomplete#CompleteCSS

"vim-obsess settings
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

"expand %% to curent full path
cabbr <expr> %% expand('%:p:h')
set path==**         " gf rulez

" Source the vimrc file after saving it
"autocmd bufwritepost .vimrc source ~/.vimrc

"au FileType qf botright cw 160

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

function! s:ExecuteInShell(command)
  let command = join(map(split(a:command), 'expand(v:val)'))
  let winnr = bufwinnr('^' . command . '$')
  silent! execute  winnr < 0 ? 'botright vnew ' . fnameescape(command) : winnr . 'wincmd w'
  setlocal ft=text buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
  echo 'Execute ' . command . '...'
  silent! execute 'silent %!'. command
  silent! execute 'resize '
  silent! redraw
  silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
  silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
  echo 'Shell command ' . command . ' executed.'
endfunction
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)

highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

autocmd BufWritePre * :call StripTrailingWhitespaces()


"""""""""""""""Coc""""""""""""""""""""""""
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands.
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document.
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols.
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list.
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
let g:airline#extensions#coc#enabled = 1
