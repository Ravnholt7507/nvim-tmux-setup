require('copilot').setup({
	panel = {
		enabled = true,
		auto_refresh = true,
		keymap = {
			jump_next = "<C-j>",
			jump_prev = "<C-k>",
			open = "<M-CR>",
			refresh = "gr",
			close = "<M-q>",
		},
	},
	suggestion = {
		enabled = true,
		auto_trigger = true,
		debounce = 75,
		keymap = {
			accept = "<C-f>",
			accept_word = '<C-l>',
			accept_line = false,
		},
	},
	filetypes = {
		yaml = false,
		markdown = false,
		help = false,
		gitcommit = false,
		gitrebase = false,
		hgcommit = false,
		svn = false,
		cvs = false,
		["."] = false,
	},
	copilot_node_command ='node',
	server_opts_overrides = {},
})
