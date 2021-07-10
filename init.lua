local api = vim.api
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

-- Custom function for keymapping
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Plugins extravaganza
cmd 'packadd paq-nvim'               -- load the package manager
local paq = require('paq-nvim').paq  -- a convenient alias
paq {'savq/paq-nvim', opt = true}    -- paq-nvim manages itself

-- completion
paq {'nvim-lua/completion-nvim'}
-- syntax highlighting
paq {'nvim-treesitter/nvim-treesitter'}
-- LSP management
paq {'neovim/nvim-lspconfig'}
-- fuzzy search
paq {'junegunn/fzf', run = fn['fzf#install']}
paq {'junegunn/fzf.vim'}
paq {'ojroques/nvim-lspfuzzy'}
-- tree/file navigation
paq {'justinmk/vim-dirvish'}
paq {'kristijanhusak/vim-dirvish-git'}

paq {'tpope/vim-unimpaired'}
paq {'tpope/vim-repeat'}
paq {'tpope/vim-surround'}
paq {'tpope/vim-fugitive'}
paq {'tpope/vim-eunuch'}
paq {'tpope/vim-endwise'}

-- statusline
paq {'hoob3rt/lualine.nvim'}
paq {'kyazdani42/nvim-web-devicons'}
paq {'ryanoasis/vim-devicons'}

paq {'scrooloose/nerdcommenter'}
-- search
paq {'mileszs/ack.vim'}
paq {'rking/ag.vim'}

-- themes
paq {'morhetz/gruvbox'}
paq {'altercation/vim-colors-solarized'}
paq {'vim-airline/vim-airline-themes'}
paq {'tiagovla/tokyodark.nvim'}
-- End of plugins extravaganza

-- setup status line
require('lualine').setup()

g.mapleader = ','

-- theme setup
cmd 'colorscheme tokyodark'
g['tokyodark_transparent_background'] = 1
g['tokyodark_enable_italic_comment'] = 1
g['tokyodark_enable_italic'] = 1
g['tokyodark_color_gamma'] = "1.0"

-- Global options
opt.completeopt = {'menuone', 'noinsert', 'noselect'}  -- Completion options
opt.expandtab = true                -- Use spaces instead of tabs
opt.hidden = true                   -- Enable background buffers
opt.ignorecase = true               -- Ignore case
opt.joinspaces = false              -- No double spaces with join
opt.list = true                     -- Show some invisible characters
opt.number = true                   -- Show line numbers
opt.relativenumber = false           -- Relative line numbers
opt.scrolloff = 4                   -- Lines of context
opt.shiftround = true               -- Round indent
opt.shiftwidth = 2                  -- Size of an indent
opt.sidescrolloff = 8               -- Columns of context
opt.smartcase = true                -- Do not ignore case with capitals
opt.incsearch = true                -- Enable incremental search
opt.smartindent = true              -- Insert indents automatically
opt.splitbelow = true               -- Put new windows below current
opt.splitright = true               -- Put new windows right of current
opt.tabstop = 2                     -- Number of spaces tabs count for
opt.termguicolors = true            -- True color support
opt.wildmode = {'list', 'longest'}  -- Command-line completion mode
opt.wrap = false                    -- Disable line wrap
opt.textwidth = 180                 -- show max column ruler


-- dirvish
g['dirvish_mode'] = [[:sort ,^.*[\/],]]

-- Search with ag
g['ackprg'] = 'ag --nogroup --nocolor --column'

-- Search word under cursor with AG
map('n', '<leader>ag', '<Esc>:Ack!<CR>')

-- Clear search highlighting
map('n', '<Space>', ':noh<cr>')

-- FZF file & buffer search
map('n', '<leader>t', ':FZF<CR>')
map('n', '<leader><Space>', ':Buffers<CR>')
map('v', '<leader><Space>', ':Buffers<CR>')

-- Vertical split
map('n', '<leader>v', ':vsplit <CR>')
map('n', '<leader>==', ':vertical resize +5 <CR>')
map('n', '<leader>--', ':vertical resize -5 <CR>')
map('n', '<leader>e', ':edit $MYVIMRC<CR>')

-- Switch between buffers using ,,
map('n', '<leader>,', ':b#<CR>')

-- Open new buffer
map('n', '<leader>n', ':new<Space>')

-- Dirvish
map('n', '<leader>nn', ':Dirvish<CR>')
map('n', '<leader>nf', ':Dirvish %<CR>')

map('n', '<leader>s', ':wa<CR>')

-- LSP config(go, python)
local nvim_lsp = require('lspconfig')
local lspfuzzy = require 'lspfuzzy'
lspfuzzy.setup {}  -- Make the LSP client use FZF instead of the quickfix list

local on_attach = function(client, bufnr)
  require('completion').on_attach()

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
end

local servers = {'pyright', 'gopls'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
  }
end

nvim_lsp.elixirls.setup{
  cmd = { vim.loop.os_homedir().."/bin/elixir-ls" },
  on_attach = on_attach,
}

-- Treesitter - syntax highlighter
require'nvim-treesitter.configs'.setup {
  ensure_installed = 'maintained',
  highlight = {
    enable = true
  },
}
