local ts_status_ok, configs = pcall(require, "nvim-treesitter.configs")

if not ts_status_ok then
	print("Unable to load treesitter.configs")
	return
end
configs.setup({
	ensure_installed = "all",
	sync_install = false,
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true, disable = { "yaml" } },
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
		colors = {
			"#cc881d",
			"#a89984",
			"#b16286",
			"#d79921",
			"#689d6a",
			"#d65d0e",
			"#458588",
		},
		termcolors = {
			"Red",
			"Green",
			"Yellow",
			"Blue",
			"Magenta",
			"Cyan",
			"White",
		},
	},
})
