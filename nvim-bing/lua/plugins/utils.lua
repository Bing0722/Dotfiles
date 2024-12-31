return {
	"nvim-lua/plenary.nvim",

	{
		"nvchad/base46",
		build = function()
			require("base46").load_all_highlights()
		end,
	},
	{
		"nvchad/ui",
		lazy = false,
		config = function()
			require("nvchad")
		end,
	},

	"nvzone/volt",
	"nvzone/menu",
	{ "nvzone/minty", cmd = { "Huefy", "Shades" } },

	{
		"nvim-tree/nvim-web-devicons",
		opts = function()
			dofile(vim.g.base46_cache .. "devicons")
			return { override = require("nvchad.icons.devicons") }
		end,
	},

	{
		"folke/which-key.nvim",
		keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
		cmd = "WhichKey",
		opts = function()
			dofile(vim.g.base46_cache .. "whichkey")
			return {}
		end,
	},

	-- git stuff
	{
		"lewis6991/gitsigns.nvim",
		event = "User FilePost",
		opts = function()
			return require("nvchad.configs.gitsigns")
		end,
	},
}
