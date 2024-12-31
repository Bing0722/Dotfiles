return {
	{
		"neovim/nvim-lspconfig",
		event = "User FilePost",
		config = function()
			require("config.lspconfig").defaults()
		end,
	},
}
