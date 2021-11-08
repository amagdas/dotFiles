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


-- syntax highlighting
paq {'nvim-treesitter/nvim-treesitter'}
-- LSP management
paq {'neovim/nvim-lspconfig'}

-- completion
paq {'hrsh7th/cmp-nvim-lsp'}
paq {'hrsh7th/cmp-buffer'}
paq {'hrsh7th/cmp-path'}
paq {'hrsh7th/cmp-cmdline'}
paq {'hrsh7th/nvim-cmp'}

-- For vsnip users.
paq {'hrsh7th/cmp-vsnip'}
paq {'hrsh7th/vim-vsnip'}

-- fuzzy search
paq {'junegunn/fzf', run = fn['fzf#install']}
paq {'junegunn/fzf.vim'}
paq {'ojroques/nvim-lspfuzzy'}

-- fuzzy search via telescope
paq {'nvim-lua/plenary.nvim'}
paq {'nvim-telescope/telescope.nvim'}
--paq {'nvim-telescope/telescope-fzf-native.nvim'}

-- tree/file navigation
paq {'justinmk/vim-dirvish'}
paq {'kristijanhusak/vim-dirvish-git'}

paq {'tpope/vim-unimpaired'}
paq {'tpope/vim-repeat'}
paq {'tpope/vim-surround'}
paq {'tpope/vim-fugitive'}
paq {'tpope/vim-eunuch'}
paq {'tpope/vim-endwise'}

paq {'tpope/vim-rails'}
paq {'tpope/vim-endwise'}

-- statusline
paq {'hoob3rt/lualine.nvim'}
paq {'ryanoasis/vim-devicons'}
paq {'kyazdani42/nvim-web-devicons'}

paq {'scrooloose/nerdcommenter'}
-- search
paq {'mileszs/ack.vim'}
paq {'rking/ag.vim'}

-- themes
paq {'morhetz/gruvbox'}
paq {'altercation/vim-colors-solarized'}
paq {'vim-airline/vim-airline-themes'}
paq {'tiagovla/tokyodark.nvim'}
paq {'frenzyexists/aquarium-vim'}
-- End of plugins extravaganza

-- setup status line
require'lualine'.setup {
	options = {
		icons_enabled = true,
		path = 1,
		theme = 'gruvbox',
		component_separators = {'', ''},
		section_separators = {'', ''},
		disabled_filetypes = {}
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch'},
		lualine_c = {'filename'},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	extensions = {}
}

g.mapleader = ','

-- theme setup
cmd 'colorscheme tokyodark'
g['tokyodark_transparent_background'] = 1
g['tokyodark_enable_italic_comment'] = 1
g['tokyodark_enable_italic'] = 1
g['tokyodark_color_gamma'] = "1.0"

-- Global options
opt.completeopt = {'menu', 'menuone', 'noselect'}  -- Completion options
opt.hidden = true                   -- Enable background buffers
opt.ignorecase = true               -- Ignore case
opt.joinspaces = false              -- No double spaces with join
opt.list = true                     -- Show some invisible characters
opt.number = true                   -- Show line numbers
opt.relativenumber = false          -- Relative line numbers
opt.shiftround = true               -- Round indent
opt.expandtab = false               -- Use spaces instead of tabs
opt.shiftwidth = 4                  -- Size of an indent
opt.tabstop = 4                     -- Number of spaces tabs count for
opt.scrolloff = 4                   -- Lines of context
opt.sidescrolloff = 8               -- Columns of context
opt.smartcase = true                -- Do not ignore case with capitals
opt.incsearch = true                -- Enable incremental search
opt.smartindent = true              -- Insert indents automatically
opt.splitbelow = true               -- Put new windows below current
opt.splitright = true               -- Put new windows right of current
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

-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
	extensions = {
		fzf = {
			fuzzy = true,                    -- false will only do exact matching
			override_generic_sorter = true,  -- override the generic sorter
			override_file_sorter = true,     -- override the file sorter
			case_mode = "smart_case",        -- or "ignore_case" or "respect_case", the default case_mode is "smart_case"
		}
	}
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
--require('telescope').load_extension('fzf')

-- FZF file & buffer search
--map('n', '<leader>t', ':FZF<CR>')
--map('n', '<leader><Space>', ':Buffers<CR>')
--map('v', '<leader><Space>', ':Buffers<CR>')
map('n', '<leader>t','<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<leader><Space>', '<cmd>Telescope buffers<cr>')
map('v', '<leader><Space>', '<cmd>Telescope buffers<cr>')

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
map('v', '<leader>c', '"+y')
map('v', '<leader>p', '"+p')

api.nvim_command("au FileType go set noexpandtab")
api.nvim_command("au FileType go set shiftwidth=4")
api.nvim_command("au FileType go set softtabstop=4")
api.nvim_command("au FileType go set tabstop=4")

local cmp = require'cmp'

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		end,
	},
	mapping = {
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' }, -- For vsnip users.
	}, {
		{ name = 'buffer' },
	})
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Pretty diagnostic signs
cmd [[ sign define DiagnosticSignError text=🔴 ]]
cmd [[ sign define DiagnosticSignWarning text=🟠 ]]
cmd [[ sign define DiagnosticSignInformation text=🔵 ]]
cmd [[ sign define DiagnosticSignHint text=🟢 ]]

-- LSP config(go, python)
local nvim_lsp = require('lspconfig')
local lspfuzzy = require 'lspfuzzy'
lspfuzzy.setup {}  -- Make the LSP client use FZF instead of the quickfix list

local on_attach = function(client, bufnr)
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
	buf_set_keymap('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

	-- Set some keybinds conditional on server capabilities
	if client.resolved_capabilities.document_formatting then
		buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	elseif client.resolved_capabilities.document_range_formatting then
		buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	end

	api.nvim_command("au BufWritePre *.go lua goimports(1000)")
	api.nvim_command("au BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)")
end

local servers = {'gopls', 'pyright', 'solargraph'}
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end

nvim_lsp.elixirls.setup{
	cmd = { vim.loop.os_homedir().."/bin/elixir-ls/launch-server.sh" },
	on_attach = on_attach,
	capabilities = capabilities,
}

function goimports(timeout_ms)
	local context = { only = { "source.organizeImports" } }
	vim.validate { context = { context, "t", true } }

	local params = vim.lsp.util.make_range_params()
	params.context = context

	-- See the implementation of the textDocument/codeAction callback
	-- (lua/vim/lsp/handler.lua) for how to do this properly.
	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
	if not result or next(result) == nil then return end
	local actions = result[1].result
	if not actions then return end
	local action = actions[1]

	-- textDocument/codeAction can return either Command[] or CodeAction[]. If it
	-- is a CodeAction, it can have either an edit, a command or both. Edits
	-- should be executed first.
	if action.edit or type(action.command) == "table" then
		if action.edit then
			vim.lsp.util.apply_workspace_edit(action.edit)
		end
		if type(action.command) == "table" then
			vim.lsp.buf.execute_command(action.command)
		end
	else
		vim.lsp.buf.execute_command(action)
	end
end

-- Treesitter - syntax highlighter
require'nvim-treesitter.configs'.setup {
	ensure_installed = 'maintained',
	highlight = {
		enable = true
	},
}
