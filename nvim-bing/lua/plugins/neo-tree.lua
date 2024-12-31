return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		enabled = false,
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		cmd = "Neotree",
		keys = {
			{ "<leader>e", "<leader>fe", desc = "Explorer NeoTree (Root Dir)", remap = true },
		},
		opts = {
			sources = { "filesystem", "buffers", "git_status" },
			open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
			filesystem = {
				bind_to_cwd = false,
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
			},
			window = {
				default_component_configs = {
					indent = {
						with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
						expander_collapsed = "",
						expander_expanded = "",
						expander_highlight = "NeoTreeExpander",
					},
					git_status = {
						symbols = {
							unstaged = "󰄱",
							staged = "󰱒",
						},
					},
				},
			},
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		opts = function()
			require("nvim-tree").setup({
				filters = { dotfiles = false },
				disable_netrw = true,
				hijack_cursor = true,
				sync_root_with_cwd = true,
				update_focused_file = {
					enable = true,
					update_root = false,
				},
				view = {
					width = 30,
					preserve_window_proportions = true,
				},
				renderer = {
					root_folder_label = false,
					highlight_git = true,
					indent_markers = { enable = true },
					icons = {
						glyphs = {
							default = "󰈚",
							folder = {
								default = "",
								empty = "",
								empty_open = "",
								open = "",
								symlink = "",
							},
							git = { unmerged = "" },
						},
					},
				},
			})
		end,
	},
}
