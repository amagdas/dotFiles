local api = vim.api
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

local function map(mode, lhs, rhs, opts)
	local options = {noremap = true}
	if opts then options = vim.tbl_extend('force', options, opts) end
	api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Plugins extravaganza
require "paq" {
	{'savq/paq-nvim', opt = true};    -- paq-nvim manages itself

	-- syntax highlighting
	'nvim-treesitter/nvim-treesitter';
	'nvim-treesitter/nvim-treesitter-context';
	-- LSP management
	'neovim/nvim-lspconfig';

	-- navigation
	'alexghergh/nvim-tmux-navigation';
	-- completion
	'hrsh7th/cmp-nvim-lsp';
	'hrsh7th/cmp-buffer';
	'hrsh7th/cmp-path';
	'hrsh7th/cmp-cmdline';
	'hrsh7th/nvim-cmp';

	-- For vsnip users.
	'hrsh7th/cmp-vsnip';
	'hrsh7th/vim-vsnip';

	-- fuzzy search
	{'junegunn/fzf', build = fn['fzf#install']};
	'junegunn/fzf.vim';
	'ojroques/nvim-lspfuzzy';

	-- fuzzy search via telescope
	'nvim-lua/plenary.nvim';
	'nvim-telescope/telescope.nvim';
	'nvim-telescope/telescope-fzf-native.nvim';

	-- tree/file navigation
	{'nvim-neo-tree/neo-tree.nvim', branch = 'v2.x'},

	'tpope/vim-unimpaired';
	'tpope/vim-repeat';
	'tpope/vim-surround';
	'tpope/vim-fugitive';
	'tpope/vim-eunuch';

	'tpope/vim-rails';
	'tpope/vim-endwise';

	'junegunn/goyo.vim';
	-- statusline
	'hoob3rt/lualine.nvim';
	'ryanoasis/vim-devicons';
	'kyazdani42/nvim-web-devicons';
	'MunifTanjim/nui.nvim';

	'scrooloose/nerdcommenter';
	-- search
	'mileszs/ack.vim';
	'rking/ag.vim';

	-- themes
	'morhetz/gruvbox';
	'altercation/vim-colors-solarized';
	'vim-airline/vim-airline-themes';
	'tiagovla/tokyodark.nvim';
	'frenzyexists/aquarium-vim';
	'iandwelker/rose-pine-vim';
	'catppuccin/nvim';
	-- File types
	'google/vim-jsonnet'
	-- End of plugins extravaganza
}

-- Disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1


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
--cmd 'colorscheme gruvbox'
--cmd 'set background=light'

--cmd 'set background=light'
cmd 'set background=dark'
require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true,
})

cmd 'colorscheme catppuccin'
--[[cmd 'colorscheme tokyodark']]
--[[g['tokyodark_transparent_background'] = 1]]
--[[g['tokyodark_enable_italic_comment'] = 1]]
--[[g['tokyodark_enable_italic'] = 1]]
--[[g['tokyodark_color_gamma'] = "1.0"]]

-- Global options
vim.o.guifont = "Iosevka Nerd Font Mono:h16" -- text below applies for VimScript

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
opt.textwidth = 140                 -- show max column ruler
--opt.colorcolumn = '+1'              -- highlight max column ruler ??SLOW??

-- dirvish folders first
--g['dirvish_mode'] = [[:sort ,^.*[\/],]]

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

require('nvim-tmux-navigation').setup {
	disable_when_zoomed = true, -- defaults to false
	keybindings = {
		left = "<C-h>",
		down = "<C-j>",
		up = "<C-k>",
		right = "<C-l>",
		last_active = "<C-\\>",
		next = "<C-Space>",
	}
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
--require('telescope').load_extension('fzf')

-- FZF file & buffer search
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
map('n', '<leader>nn', ':NeoTreeShow<CR>')
map('n', '<leader>nf', ':NeoTreeReveal<CR>')

map('n', '<leader>s', ':wa<CR>')
map('v', '<leader>c', '"+y')
map('v', '<leader>p', '"+p')
map('n', '<leader>zz', ':Goyo 160x99<CR>')
map('v', '<leader>zz', ':Goyo 160x99<CR>')
map('n', '<leader>zx', ':Goyo!<CR>')
map('v', '<leader>zx', ':Goyo!<CR>')

api.nvim_command("au FileType go set noexpandtab")
api.nvim_command("au FileType go set shiftwidth=4")
api.nvim_command("au FileType go set softtabstop=4")
api.nvim_command("au FileType go set tabstop=4")

nt = require("neo-tree")
nt.setup({
	buffers = {
		follow_current_file = true, -- This will find and focus the file in the active buffer every
		-- time the current file is changed while the tree is open.
		group_empty_dirs = true, -- when true, empty folders will be grouped together
		show_unloaded = true,
		window = {
			mappings = {
				["bd"] = "buffer_delete",
				["<bs>"] = "navigate_up",
				["."] = "set_root",
			}
		},
	},
})

local cmp = require'cmp'

cmp.setup({
	snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
	mapping = {
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
	  ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end
    },
	window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' }, -- For vsnip users.
	}, {
		{ name = 'buffer' },
	})
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

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
	if client.server_capabilities.document_formatting then
		buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	elseif client.server_capabilities.document_range_formatting then
		buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	end

	api.nvim_command("au BufWritePre *.go lua goimports(1000)")
	api.nvim_command("au BufWritePre <buffer> lua vim.lsp.buf.format(nil, 1000)")
end

local servers = {'pyright', 'solargraph'}
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
		debounce_text_changes = 150,
	}
end

nvim_lsp.elixirls.setup{
	--cmd = { "/opt/homebrew/Cellar/elixir-ls/0.17.4/libexec/language_server.sh" },
	cmd = { "/opt/homebrew/bin/elixir-ls" },
	on_attach = on_attach,
	capabilities = capabilities,
	debounce_text_changes = 150,
}

nvim_lsp.gopls.setup{
	on_attach = on_attach,
	capabilities = capabilities,
	debounce_text_changes = 150,
	settings = {
		gopls = {
			experimentalPostfixCompletions = true,
			analyses = {
				unusedparams = true,
				shadow = true,
			},
			staticcheck = true,
			buildFlags = {"-tags=or_test,or_dev,or_e2e,or_int,or_manual"},
		},
	},
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
			vim.lsp.util.apply_workspace_edit(action.edit, "utf-8")
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
	ignore_install = { "phpdoc" },
	ensure_installed = 'all',
	highlight = {
		enable = true
	},
}
